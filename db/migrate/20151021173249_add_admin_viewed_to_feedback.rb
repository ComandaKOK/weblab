class AddAdminViewedToFeedback < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :adminview, :boolean, default: false
  end
end