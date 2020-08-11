class ItemAddress

  include ActiveModel::Model
  attr_accessor :city, :address, :area_id, :building, :tel, :postal_code, :item_id,:token, :user_id


 
  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  TEL_REGEX = /\A\d{10,11}\z/.freeze

  with_options presence: true do
    validates :postal_code, format: {with: POSTAL_CODE_REGEX}
    validates :city
    validates :address
    validates :tel, format: {with: TEL_REGEX }
    validates :area_id
    validates :token
  end

  validates :area_id, numericality: { other_than: 1 }

  def save
     Purchase.create(item_id: item_id, user_id: user_id)

    UserAddress.create(postal_code: postal_code, area_id: area_id, city: city, address: address, tel: tel, item_id: item_id)
  end

end