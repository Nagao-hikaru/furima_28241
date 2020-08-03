#テーブル設計

##users テーブル

| column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| last_name        | string | null: false |
| family_name_kana | string | null: false |
| last_name_kana   | string | null: false |
| birthday         | date   | null: false |

###Association
-has many :items
-has many :purchases

##Itemsテーブル

| column           | type       | options                                     |
| ---------------- | ---------- | ------------------------------------------- |
| image            | string     | null: false                                 |
| name             | string     | null: false                                 |
| description      | text       | null: false                                 |
| user             | references | null: false, index: true, foreign_key: true |
| price            | integer    | null: false                                 |
| condition_id     | integer    | null: false                                 |
| category_id      | integer    | null: false                                 |
| burden_id        | integer    | null: false                                 |
| area_id          | integer    | null: false                                 |
| delivery_day_id | integer    | null: false                                 |

###Association
-belongs_to :user
-has_one :purchase
-has_one :user_address

##purchasesテーブル

| column          | type       | options                                     |
| --------------- | ---------- | ------------------------------------------- |
| user            | references | null: false, index: true, foreign_key: true |
| item            | references | null: false, index: true, foreign_key: true |

###Association
-belongs_to :user
-belongs_to :item

##User_addressesテーブル

| column      | type       | options                        |
| ----------- | ---------- | ------------------------------ |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| address     | string     | null: false                    |
| building    | string     |                                |
| tel         | string     | null: false                    |
| postal_code | string     | null: false                    |
| item        | references | null: false, foreign_key: true |

##Association
belongs_to :item