class AddSecurityLevelToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :security, :integer, default: 1
  end
end
