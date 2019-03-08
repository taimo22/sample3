class Topic < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: {maximum: 2000}
  validates :name, presence:  true, length: {maximum: 300}
end
