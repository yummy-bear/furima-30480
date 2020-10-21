# README

## usersテーブル


| Column          | Type   | Options    | 
| --------------- | ------ | ---------- | 
| nickname        | string | null_false | 
| email           | string | null_false | 
| password        | string | null_false | 
| first_name      | string | null_false | 
| last_name       | string | null_false | 
| first_name_kana | string | null_false | 
| last_name_kana  | string | null_false | 
| birth_day       | date   | null_false | 

## Association
- has_many :items
- has_many :purchases


## itemsテーブル
  
| Column           | Type       | Options           | 
| ---------------- | ---------- | ----------------- | 
| name    　　　    | string     | null_false        | 
| introduction     | text       | null_false        |
| status_id        | integer    | null_false        | 
| category_id      | integer    | null_false        | 
| delivery_fee_id  | integer    | null_false        | 
| delivery_area_id | integer    | null_false        | 
| delivery_day_id  | string     | null_false        | 
| price            | integer    | null_false        | 
| user             | reference  | foreign_key: true | 

## Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column | Type       | Options           | 
| ------ | ---------- | ----------------- | 
| user   | reference  | foreign_key: true | 
| item   | reference  | foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

| Column       | Type      | Options           | 
| ------------ | --------- | ----------------- | 
| zip          | string    | null_false        | 
| state_id     | integer   | null_false        | 
| city         | string    | null_false        | 
| address_line | string    | null_false        | 
| building     | string    |                   | 
| phone_number | string    | null_false        |
| purchase     | reference | foreign_key: true | 


## Association
- belongs_to :purchase