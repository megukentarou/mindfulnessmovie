# README

# このアプリを開発した経緯
・私自身が39歳と言う年齢で未経験からエンジニア転職を目指す際に「毎日の限られた時間の中で、いかに学習効率（成長スピード）を上げていけるか。そして、その為に学習中の集中力を上げる状態をどの様に作り上げられるか」を１つの課題と捉えていました

・普段仕事をしていると様々な事を考えてしまい、帰宅後にいざ学習しようとしても、頭の中は仕事の事ばかり考えてしまい、学習に集中出来ない日も実際にありました

・そこで現在通っているプログラミングスクールで紹介されたマインドフルネスを実践して、学習中の集中力を上げられる様な試みを行いました（他にも起床時間を早くして、朝の時間で学習時間をある程度確保したり、食事後に眠くならない様な食事方法の見直し等も並行）

・マインドフルネスを実践する事で、以前に比べると集中した状態を作りやすくなり、また集中できる時間も継続できた実感があります。そこで、私と同じ様な悩みを持つ方に向けて、自分がマインドフルネスを実践するにあたって、おすすめの動画をまとめてみる動画集を作成しようと考えました

# アプリの使い方
・時間の長さに分けて簡単な絞り込みができます
・各動画に時間の長さ（目安）BGMの有無、自然音なのか、ヒーリング系なのかを紹介しています。様々な種類のマインドフルネス動画をまとめています。
ユーザー登録を行うと、お気に入り登録が出来ます。個人の目的やレベル、使いやすさに応じてお気に入りの動画を使ってください

* version
Ruby 2.5.1
Rails 5.2.4.4

# my-mindfulness DB設計

## usersテーブル
- ユーザー情報
 - ニックネームが必須(8文字以内)
 - メールアドレスは一意である
 - メールアドレスは@とドメインを含む必要がある
 - パスワードが必須
 - パスワードは6文字以上
 - パスワードは確認用を含めて2回入力する

|Column|Type|Options|
|------|----|-------|
|nicmname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|encrypted_password|string|null: false|
### Association
- has_many :movies
- has_many :favorites


## moviesテーブル
- 動画情報
 - タイトルが必須(100文字以内)
 - 動画の説明文が必須(1000文字以内)
 - 動画のurlが必須(youtubeの動画URLの末11桁)
 - 動画時間の選択が必須

|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|string|null: false|
|url|string|null: false|
|time|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :favorites

## favoritesテーブル
- お気に入りを登録する

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|movie_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :movie

## ER図
https://drive.google.com/file/d/13LzzKahjCm4qN5VVieaDOnfPK9rgJbDW/view?usp=sharing

## URL
54.250.80.236
* ...
