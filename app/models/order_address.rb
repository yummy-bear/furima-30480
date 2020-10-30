class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :zip_code, :delivery_area_id, :city, :address_line, :building_name, :phone_number, :order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: {with: /\A\d{3}[-]\d{4}\z/ }
    validates :delivery_area_id, numericality: { other_than: 1 }
    validates :city
    validates :address_line
    validates :phone_number, format: {with: /\A\d{11}\z/ }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, delivery_area_id: delivery_area_id, city: city, address_line: address_line, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end


end