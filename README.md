# README

## usersテーブル


| Column        　　　  | Type   | Options    | 
| -------------------- | ------ | ---------- | 
| nickname      　　　  | string | null_false | 
| email                | string | null_false | 
| encrypted_password   | string | null_false | 
| first_name           | string | null_false | 
| last_name            | string | null_false | 
| first_name_kana      | string | null_false | 
| last_name_kana       | string | null_false | 
| birth_day            | date   | null_false | 

## Association
- has_many :items
- has_many :orders


## itemsテーブル
  
| Column           | Type       | Options           | 
| ---------------- | ---------- | ----------------- | 
| name             | string     | null_false        | 
| introduction     | text       | null_false        |
| status_id        | integer    | null_false        | 
| category_id      | integer    | null_false        | 
| delivery_fee_id  | integer    | null_false        | 
| delivery_area_id | integer    | null_false        | 
| delivery_day_id  | integer    | null_false        | 
| price            | integer    | null_false        | 
| user             | references | foreign_key: true | 

## Association
- belongs_to :user
- has_one :order


## ordersテーブル

| Column  | Type        | Options           | 
| ------- | ----------- | ----------------- | 
| user    | references  | foreign_key: true | 
| item    | references  | foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column       | Type       | Options           | 
| ------------ | ---------- | ----------------- | 
| zip_code     | string     | null_false        | 
| delivery_area| integer    | null_false        | 
| city         | string     | null_false        | 
| address_line | string     | null_false        | 
| building_name| string     |                   | 
| phone_number | string     | null_false        |
| order        | references | foreign_key: true | 


## Association
- belongs_to :order