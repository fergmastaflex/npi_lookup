class Provider < ApplicationRecord
  has_many :addresses
  has_many :taxonomies
  acts_as_list add_new_at: :top
  accepts_nested_attributes_for :addresses, :taxonomies

  validates :name, :npi, presence: true
  validates :npi, uniqueness: true
  validates :npi, numericality: { only_integer: true }
end
