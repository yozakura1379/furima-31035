class UserPurchase
  include ActiveModel::Model
  attr_accessor :token,
                :postal_code,
                :prefecture,
                :city,
                :house_number,
                :building_name,
                :tel,
                :user_id,
                :item_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :tel, format: { with: /\A\d{11}\z/ }
    validates :tel, length: { maximum: 11 }
    validates :city
    validates :house_number
    validates :prefecture
    validates :token
  end

  validates :prefecture_id, { other_than: 1 }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, tel: tel, purchase_id: purchase.id)
  end
end
