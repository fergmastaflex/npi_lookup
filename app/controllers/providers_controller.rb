class ProvidersController < ApplicationController
  def index
    find_or_create_provider(params[:query])
    @providers = Provider.includes(:addresses, :taxonomies).order(position: :asc)
  end

  def update
    @provider = Provider.find(params[:id])
    @provider.update!(provider_params)
  end

  private

  def provider_params
    params.permit(:position)
  end

  def find_or_create_provider(number)
    return unless number.present?
    provider = Provider.find_by(npi: number)
    if provider.present?
      provider.move_to_top
      flash[:notice] = 'That provider already exists in this system'
    else
      Provider.create!(NpiService.get_provider(number))
      flash[:notice] = 'The provider was added to the system'
    end
  end
end
