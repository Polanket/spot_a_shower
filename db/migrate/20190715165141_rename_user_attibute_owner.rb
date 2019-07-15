class RenameUserAttibuteOwner < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :owner?, :owner
  end
end
