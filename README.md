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

| column      | type       | options                                     |
| ----------- | ---------- | ------------------------------------------- |
| image       | string     | null: false                                 |
| name        | string     | null: false                                 |
| description | text       | null: false                                 |
| user_id     | references | null: false, index: true, foreign_key: true |

###Association
-belongs_to :user
-has_one :purchase

##purchasesテーブル

| column          | type       | options                                     |
| --------------- | ---------- | ------------------------------------------- |
| user_id         | references | null: false, index: true, foreign_key: true |
| item_id         | references | null: false, index: true, foreign_key: true |
| user_address_id | references | null: false, index: true, foreign_key: true |

###Association
-belongs_to :user
-belongs_to :item
-belongs_to :user_address

##User_addressesテーブル

| column     | type    | options     |
| ---------- | ------- | ----------- |
| prefecture | string  | null: false |
| city       | string  | null: false |
| address    | string  | null: false |
| building   | string  |             |
| tel        | integer | null: false |

##Association
has_one :purchase