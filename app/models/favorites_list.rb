class FavoritesList < ApplicationRecord
  before_save { self.user_item = "#{user_id}" + "#{item_id}" }

  belongs_to :user, dependent: :destroy
  belongs_to :item

  validates_presence_of :user
  # validate :item, uniqueness: true, unless: Proc.new { |e| e.user_id.present? }
  # validates :item, uniqueness: { scope: :user_id, message: "Item already added in user's list" }
  validates_presence_of :item
  validates_presence_of :user_item
end
