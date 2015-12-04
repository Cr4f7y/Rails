class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :heading
      t.string :body
      t.belongs_to :client, index: true
      t.timestamps null: false
    end
  end
end
