class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :mess
      t.belongs_to :client, index: true
      t.timestamps
    end
  end
end
