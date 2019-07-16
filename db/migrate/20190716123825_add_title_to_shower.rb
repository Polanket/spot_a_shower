class AddTitleToShower < ActiveRecord::Migration[5.2]
  def change
    add_column :showers, :title, :string
  end
end
