class User < ApplicationRecord
  has_one :favorites_list, dependent: :destroy
  has_many :items, through: :favorites_list

  validates :name, presence: true, length: { in: 3..20 }
end
