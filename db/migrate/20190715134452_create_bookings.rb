class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :date
      t.date :time
      t.boolean :confirmed?, default: false
      t.references :user, foreign_key: true
      t.references :shower, foreign_key: true

      t.timestamps
    end
  end
end
