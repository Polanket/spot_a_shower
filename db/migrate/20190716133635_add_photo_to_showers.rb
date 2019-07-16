class AddPhotoToShowers < ActiveRecord::Migration[5.2]
  def change
    add_column :showers, :photo, :string
  end
end
