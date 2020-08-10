module ErrorHandler
  extend ActiveSupport::Concern

  class NpiError < StandardError; end

  included do
    rescue_from ErrorHandler::NpiError, with: :render_npi_error
  end

  def render_npi_error
    flash.alert = 'Unable to find provider with this NPI'
    redirect_to :providers
  end
end
