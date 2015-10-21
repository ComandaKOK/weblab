class AddAdminAnswerToFeedback < ActiveRecord::Migration
  def change
  	add_column :feedbacks, :adminanswer, :string, default: nil
  end
end
