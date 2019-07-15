class CreateShowers < ActiveRecord::Migration[5.2]
  def change
    create_table :showers do |t|
      t.text :description
      t.string :address
      t.text :features
      t.integer :price
      t.date :availability
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
