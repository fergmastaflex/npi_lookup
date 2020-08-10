require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe 'validations' do
    it { is_expected.to(validate_presence_of(:name)) }
    it { is_expected.to(validate_presence_of(:npi)) }
    it { is_expected.to(validate_numericality_of(:npi)) }
  end
end
