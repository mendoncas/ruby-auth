class Default < ApplicationRecord
  validates :description, presence: true

  belongs_to :user
  has_one :link, dependent: :destroy
end
