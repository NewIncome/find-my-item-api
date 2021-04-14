class CreateFavoritesLists < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :item, null: false
      t.string :user_item, index: { unique: true }

      t.timestamps
    end
  end
end
