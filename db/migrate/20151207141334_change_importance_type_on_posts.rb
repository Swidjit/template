class ChangeImportanceTypeOnPosts < ActiveRecord::Migration
  def change
    change_column :posts, :importance, :float
  end
end
