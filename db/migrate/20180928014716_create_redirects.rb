class CreateRedirects < ActiveRecord::Migration[5.2]
  def change
    create_table :redirects do |t|
      t.string :location
      t.datetime :time

      t.belongs_to :link, index: true

      t.timestamps
    end
  end
end
