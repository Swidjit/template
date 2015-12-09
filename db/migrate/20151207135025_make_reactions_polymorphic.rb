class MakeReactionsPolymorphic < ActiveRecord::Migration
  def change
    add_column :reactions, :reactable_id, :integer
    add_column :reactions, :reactable_type, :string
    remove_column :reactions, :post_id
  end
end
