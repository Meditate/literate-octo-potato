class User < ApplicationRecord
  has_many :frames

  validates :api_key, presence: true, uniqueness: true
end
