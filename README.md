# アプリケーション名

ArtiCle
=======

<img width="1160" alt="README" src="https://user-images.githubusercontent.com/75027499/107139750-e7b35a80-6960-11eb-95e4-d99fd7d00b75.png">

# 概要

「ArtiCle」とは、「Artist」×「Circle」から来ています。
世界中には、大勢の多種多様なアーティストがいます。何かきっかけがない限り好きになれるアーティストにはなかなか巡り合えません。
このアプリは、ユーザー同士で好きなアーティストの輪を広げる為のチャットツールです。

# アプリURL

- ゲストユーザーとしてワンタッチログインが可能です
https://arti-cle.herokuapp.com/

# 目指した課題解決
- 知っている又は好きなアーティストの幅を増やしたい
- 好きなアーティストについて語り合いたい
- アーティスト情報をファン同士で共有したい

# DEMO
## トップページ画面
<img width="1160" alt="top-image" src="https://user-images.githubusercontent.com/75027499/107139750-e7b35a80-6960-11eb-95e4-d99fd7d00b75.png">

## 新規登録画面
<img width="1159" alt="signup-image" src="https://user-images.githubusercontent.com/75027499/107141021-775d0700-6969-11eb-9d45-ef432f87b534.png">

## ログイン画面
<img width="1150" alt="login-image" src="https://user-images.githubusercontent.com/75027499/107141056-ae331d00-6969-11eb-92eb-a1e4632ac8b5.png">

## アーティスト一覧画面
<img width="1150" alt="artist-image" src="https://user-images.githubusercontent.com/75027499/108620206-e65c5480-746d-11eb-8eeb-cbbd764bde77.gif">

# 使用技術(開発環境)
## フレームワーク
- Ruby on Rails(6.0.0)
## CSSフレームワーク
- Bootstrap
## バックエンド
- Ruby(2.6.5)
## フロントエンド
- HTML
- SCSS
- Javascript
- jquery
- ajax
## データベース
- MySQL
## テスト
- RSpec
## バージョン管理
- GitHub
## デプロイ環境
- heroku

# 追加実装予定項目
- カレンダー機能(マイページに表示予定)
- ユーザーフォロー機能
- DM機能(相互フォロー時のみ)
- アーティスト詳細項目(アーティスト公式ページへのリンクなど表示)
- メンション機能

# ER図

<img width="577" alt="ER図" src="https://user-images.githubusercontent.com/75027499/107758434-3484a000-6d6a-11eb-8592-2872330be2cb.png">

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

## room_users テーブル

| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## rooms テーブル

| Column      | Type    | Options                   |
|-------------|---------|---------------------------|
| artist_name | string  | null: false, unique: true |
| genre_id    | integer | null: false               |

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

## Author
- https://github.com/Fuka-Aki

