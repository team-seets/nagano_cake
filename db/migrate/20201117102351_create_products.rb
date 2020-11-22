class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :introduction
      t.integer :genre_id
      t.string :name
      t.integer :price
      t.string :image_id
      t.boolean :is_active, default: false
      t.timestamp :updated_at
      t.timestamp :created_at

      t.timestamps
    end
  end
end
