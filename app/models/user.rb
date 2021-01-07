class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  validates :password, presence: true

  # has_one :user_type, dependent: :destroy, polymorphic: true
  has_one :admin, dependent: :destroy
  has_one :default, dependent: :destroy
  has_one :physio, dependent: :destroy
end
