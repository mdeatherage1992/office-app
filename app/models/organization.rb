class Organization < ApplicationRecord
  validates :name, presence: true
  validates :rate, numericality: { greater_than: 0 }
  has_many :users, dependent: :nullify
  has_many :shifts, through: :users
end
