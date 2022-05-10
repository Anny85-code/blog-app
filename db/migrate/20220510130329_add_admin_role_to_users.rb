class AddAdminRoleToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin_role, :string
    add_column :users, :string, :string
  end
end
