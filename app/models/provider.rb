class Provider < ApplicationRecord
  has_many :addresses
  has_many :taxonomies

  validates :name, :npi, presence: true
  validates :npi, numericality: { only_integer: true }
end
