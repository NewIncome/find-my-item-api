class FavoritesList < ApplicationRecord
  before_validation { self.user_item = "#{user_id}" + "#{item_id}" }

  belongs_to :user, dependent: :destroy
  belongs_to :item

  validates_presence_of :user, :item, :user_item
  # validate :item, uniqueness: true, unless: Proc.new { |e| e.user_id.present? }
  # validates :item, uniqueness: { scope: :user_id, message: "Item already added in user's list" }
end
