require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end

  describe 'ルーム新規作成' do
    context 'ルームが作成できる場合' do
      it '全ての項目が入力されていれば、作成できる' do
        expect(@room).to be_valid
      end
    end
    context 'ルームが作成できない場合' do
      it 'artist_nameが空だと作成できない' do
        @room.artist_name = nil
        @room.valid?
        expect(@room.errors.full_messages).to include('アーティスト名を入力してください')
      end
      it 'genre_idが空だと作成できない' do
        @room.genre_id = nil
        @room.valid?
        expect(@room.errors.full_messages).to include('ジャンルを入力してください')
      end
      it 'genre_idで0が選択されている場合は作成できない' do
        @room.genre_id = nil
        @room.valid?
        expect(@room.errors.full_messages).to include('ジャンルは数値で入力してください')
      end
      it 'imageが空だと作成できない' do
        @room.image = nil
        @room.valid?
        expect(@room.errors.full_messages).to include('画像を入力してください')
      end
    end
  end
end
