class FavoritesList < ApplicationRecord
  before_validation { self.user_item = user_id.to_s + item_id.to_s }

  belongs_to :user
  belongs_to :item

  validates_presence_of :user, :item, :user_item
end
