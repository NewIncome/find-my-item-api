class Item < ApplicationRecord
  has_many :favorites_lists

  validates_presence_of :name, :description
  validates :name, length: { in: 3..20 }
  validates :description, length: { in: 8..300 }
end
