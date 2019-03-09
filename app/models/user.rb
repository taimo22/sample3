class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :topics

  validates :name, presence: true, length: {maximum: 25 }
  validates :intro, presence: true, length: {maximum: 500}
  validates :job, presence:  true, length: {maximum: 25}
  validates :school, presence: true, length: {maximum: 25}


  has_many :ownerships
  has_many :good_topics, through: :ownerships, source: :topic, dependent: :destroy

  def good(topic)
    self.ownerships.find_or_create_by(topic_id: topic.id)
  end

  def ungood(topic)
    good = self.ownerships.find_by(topic_id: topic.id)
    good.destroy if good
  end

  def good?(topic)
    self.good_topics.include?(topic)
  end
end
