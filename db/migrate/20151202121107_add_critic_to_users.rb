class AddCriticToUsers < ActiveRecord::Migration
  def change
    add_column :users, :critic, :boolean, default: false, null: false
  end
end
