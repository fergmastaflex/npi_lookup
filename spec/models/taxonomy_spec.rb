require 'rails_helper'

RSpec.describe Taxonomy, type: :model do
  describe 'associations' do
    it { is_expected.to(belong_to(:provider)) }
  end
end
