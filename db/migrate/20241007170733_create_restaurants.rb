class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.string :location
      t.string :image_url
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
