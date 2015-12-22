class CreateSteams < ActiveRecord::Migration
  def change
    create_table :steams do |t|
      t.string :image_url
      t.string :nickname
      t.string :uid

      t.timestamps null: false
    end
  end
end
