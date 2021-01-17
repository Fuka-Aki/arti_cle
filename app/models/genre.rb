class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' }, { id: 1, name: 'ポップス' }, { id: 2, name: 'ロック' },
    { id: 3, name: 'ダンス' }, { id: 4, name: 'ジャズ' }, { id: 5, name: 'ラテン' },
    { id: 6, name: 'クラシック' }, { id: 7, name: '行進曲' }, { id: 8, name: 'ワールド' },
    { id: 9, name: '声楽' }, { id: 10, name: '邦楽' }, { id: 11, name: 'ア・カペラ' }
  ]

  include ActiveHash::Associations
  has_many :rooms
end