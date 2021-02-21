class Room < ApplicationRecord
  with_options presence: true do
    validates :artist_name, uniqueness: true
    validates :genre_id, numericality: { other_than: 0 }
    validates :image
  end

  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :image

  def self.search(search)
    if search != ''
      Room.where('artist_name LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end
