class AddUserId < ActiveRecord::Migration
  def up
    add_column :shorters, :user_id, :integer
  end

  def down
    remove_column(:shorters, :user_id)
  end
end
