class RenameUserIdToUsernameFromComments < ActiveRecord::Migration
  def change
    rename_column :comments, :user_id, :username
  end
end
