class AddOrderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :order, :integer
  end
end
