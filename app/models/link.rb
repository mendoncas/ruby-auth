class Link < ApplicationRecord
  validates :is_active, presence: true
  belongs_to :physio
  belongs_to :default
end
