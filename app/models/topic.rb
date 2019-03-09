class Topic < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: {maximum: 2000}
  validates :name, presence:  true, length: {maximum: 300}

  has_many :ownerships, dependent: :destroy
  has_many :users, through: :ownerships, dependent: :destroy



end
