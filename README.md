# テーブル設計

## users テーブル

| Column                 | Type      | Options     |
| ---------------------- | --------- | ----------- |
| nickname	             | string    | null: false |
| email	                 | string    | null: false |
| first name	           | string    | null: false |
| last name              | string    | null: false |
| first name_alias       | string    | null: false |
| last name_alias        | string    | null: false |
| birthday               | date      | null: false |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| about                  | text       | null: false                    |
| category               | integer    | null: false                    | 
| status                 | integer    | null: false                    |
| delivery_fee           | integer    | null: false                    |
| prefecture             | integer    | null: false                    |
| days                   | integer    | null: false                    |    
| user                   | references | null: false, foreign_key: true |  

### Association

- has_one : user
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

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| postal_code            | string     | null: false                    |
| prefecture             | string     | null: false                    |
| city                   | string     | null: false                    |
| house_number           | string     | null: false                    |
| building_name          | string     | null: false                    |
| tel                    | string     | null: false                    |  
| purchase               | references | null: false, foreign_key: true |  

### Association
- belongs_to :purchase

