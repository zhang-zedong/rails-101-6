class AddUserIdAndGroupId < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :group_id, :integer
    add_column :posts, :user_id, :integer
  end
end
