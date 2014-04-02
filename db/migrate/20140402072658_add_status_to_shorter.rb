class AddStatusToShorter < ActiveRecord::Migration
  def change
    add_column :shorters, :status, :boolean
  end
end
