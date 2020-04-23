class User < ApplicationRecord
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :likes_posts, through: :likes, source: :post

  validates :name, {presence: true, uniqueness: true, length: {maximum: 20}}
  validates :email, {presence: true, uniqueness: true, length: {maximum: 100}, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}}
  validates :password,{presence: true, on: :create}
end
