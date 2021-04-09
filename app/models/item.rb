class Item < ApplicationRecord
  before_validation { self.image = image.empty? ? image_link : image }

  has_many :favorites_lists

  validates_presence_of :name, :description
  validates :name, length: { in: 3..40 }
  validates :description, length: { in: 8..400 }
  validates :image, length: { minimum: 1 }

  def image_link()
    rand_img = lambda do
      num = Random.rand(1..700)
      return rand_img if [150, 578, 636].include?(num)

      num
    end

    "https://picsum.photos/id/#{rand_img.call}/437/226?blur=3"
  end
end
