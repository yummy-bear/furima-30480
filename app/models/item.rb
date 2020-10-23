class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day


  with_options presence: true do
    validates :name
    validates :introduction
    validates :status_id, numericality: { other_than: 1 } 
    validates :category_id, numericality: { other_than: 1 } 
    validates :delivery_fee_id, numericality: { other_than: 1 } 
    validates :delivery_area_id, numericality: { other_than: 1 } 
    validates :delivery_day_id, numericality: { other_than: 1 } 
    validates :price_id, format: { with: /\A[0-9]+\z/ }
    validates :user
  end


end
