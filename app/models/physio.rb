class Physio < ApplicationRecord
  validates :crefito, presence: true
  belongs_to :user
  has_many :links, dependent: :destroy
  has_many :tokens, dependent: :destroy
end
