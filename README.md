#テーブル設計

##users テーブル

| column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| last_name        | string  | null: false |
| family_name_kana | string  | null: false |
| last_name_kana   | string  | null: false |
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |

###Association
-has many :items
-has many :purchases

##Itemsテーブル

| column      | type       | options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| condition   | string     | null: false                    |
| burden      | string     | null: false                    |
| area        | string     | null: false                    |
| d_period    | string     | null: false                    |
| price       | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |

###Association
-belongs_to :user
-has_one :purchase

##purchasesテーブル

| column      | type       | options                        |
| ----------- | ---------- | ------------------------------ |
| card_number | integer    | null: false                    |
| valid_year  | integer    | null: false                    |
| valid_month | integer    | null: false                    |
| s_code      | integer    | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     |                                |
| tel         | integer    | null: false                    |
| user_id     | references | null: false, foreign_key: true |
| item_id     | references | null: false, foreign_key: true |

###Association
-belongs_to :user
-belongs_to :item