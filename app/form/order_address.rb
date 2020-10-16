class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures_id, :city, :house_num, :build_name, :phone_num, :token
  with_options presence: true do
    validates :postal_code, format: {with: (/\A\d{3}[-]\d{4}\z/)}
    validates :prefectures_id, numericality: { other_than: 1 } 
    validates :city
    validates :house_num
    validates :phone_num, length: {maximum: 11}, format: {with: (/\A[0-9]+\z/)}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id) 
    Address.create(postal_code: postal_code, postal_code: postal_code, prefectures_id: prefectures_id, city: city, house_num: house_num, build_name: build_name, phone_num: phone_num, order_id: order.id)
  end
end