class Topic < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: {maximum: 2000}
  validates :intro, presence:  true, length: {maximum: 300}
end
