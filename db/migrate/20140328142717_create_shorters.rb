class CreateShorters < ActiveRecord::Migration
  def change
    create_table :shorters do |t|
      t.string :url
      t.string :identifier
      t.text :description

      t.timestamps
    end
  end
end
