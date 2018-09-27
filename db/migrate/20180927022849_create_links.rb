class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.integer :id
      t.string :url
      t.string :hash

      t.timestamps
    end
  end
end
