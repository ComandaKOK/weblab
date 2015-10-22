class AddAdminAnswerToFeedback < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :adminanswer, :string
  end
end
