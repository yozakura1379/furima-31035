# テーブル設計

## users テーブル

| Column                           | Type      | Options     |
| -------------------------------- | --------- | ----------- |
| nickname	                       | string    | null: false |
| email	                           | string    | null: false |
| encrypted_password               | string    | null: false |
| first name	                     | string    | null: false |
| last name                        | string    | null: false |
| first name_alias                 | string    | null: false |
| last name_alias                  | string    | null: false |
| birthday                         | date      | null: false |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| name                     | string     | null: false                    |
| image                    | text       | null: false                    |
| prise                    | integer    | null: false                    |
| about                    | text       | null: false                    |
| category_id              | integer    | null: false                    | 
| status_id                | integer    | null: false                    |
| delivery_fee_id          | integer    | null: false                    |
| prefecture_id            | integer    | null: false                    |
| days_id                  | integer    | null: false                    |    
| user                     | references | null: false, foreign_key: true |  

### Association

- belongs_to : user
- has_one : purchases

## purchases テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |  
| item                   | references | null: false, foreign_key: true |  

### Association

- belongs_to : user
- belongs_to : items
- has_one : addresses

## addresses テーブル

| Column                 | Type        | Options                        |
| ---------------------- | ----------- | ------------------------------ |
| postal_code            | integer     | null: false                    |
| prefecture_id          | integer     | null: false                    |
| city                   | string      | null: false                    |
| house_number           | string      | null: false                    |
| building_name          | string      |                                |
| tel                    | string      | null: false                    |  
| purchase               | references  | null: false, foreign_key: true |  

### Association
- belongs_to :purchase

