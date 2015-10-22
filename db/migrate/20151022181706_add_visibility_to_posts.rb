class AddVisibilityToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :visibility, :boolean, default: true
  end
end
