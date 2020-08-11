class ItemAddress

  include ActiveModel::Model
  attr_accessor :city, :address, :area_id, :building, :tel, :postal_code, :item_id,:token, :user_id


 


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :address
    validates :tel, format: {with: /\A\d{10,11}\z/ }
    validates :area_id
    validates :token
  end

  validates :area_id, numericality: { other_than: 1 }

  def save
     Purchase.create(item_id: item_id, user_id: user_id)

    UserAddress.create(postal_code: postal_code, area_id: area_id, city: city, address: address, tel: tel, item_id: item_id)
  end

end