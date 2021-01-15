# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| generation_id      | integer |                           |
| gender_id          | integer |                           |
| introduction       | text    |                           |
| prefecture_id      | integer |                           |

### Association

- has_many :rooms
- has_many :favorite
- has_many :messages

## messages テーブル

| Column  | Type       | Options                        |
|---------|------------|--------------------------------|
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## rooms テーブル

| Column      | Type    | Options     |
|-------------|---------|-------------|
| artist_name | string  | null: false |
| genre_id    | integer | null: false |

### Association

- has_many :rooms
- has_many :favorite
- has_many :messages

## favorites テーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user