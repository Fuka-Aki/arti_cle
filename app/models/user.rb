class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname, length: { maximum: 12 }
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, on: :create

  has_many :room_users, dependent: :destroy
  has_many :rooms, through: :room_users
  has_many :messages
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  def already_favorited?(room)
    favorites.exists?(room_id: room.id)
  end

  def self.guest
    find_or_create_by!(email: 'guest@sample.com') do |user|
      user.password = SecureRandom.alphanumeric(6)
      user.nickname = 'Guest'
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :gender
  belongs_to :generation
end
