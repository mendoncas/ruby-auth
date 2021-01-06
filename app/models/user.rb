class User < ApplicationRecord
  has_secure_password

  # has_one :user_type, polymorphic: true
  has_one :admin, dependent: :destroy
  has_one :default, dependent: :destroy
end
