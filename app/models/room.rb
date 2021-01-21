class Room < ApplicationRecord
  with_options presence: true do
    validates :artist_name
    validates :genre_id, numericality: { other_than: 0 }
    validates :image
  end

  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
end