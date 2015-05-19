class ChangeUserIdOnComment < ActiveRecord::Migration
  def change
    change_column :comments, :user_id, :string
  end
end
