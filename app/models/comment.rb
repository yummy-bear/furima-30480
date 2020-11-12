class Comment < ApplicationRecord

  with_options presence: true do
    validates :text
    validates :user
    validates :item
  end


  belongs_to :item
  belongs_to :user
end
