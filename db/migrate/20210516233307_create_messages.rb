class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :name
      t.integer :phone_number
      t.text :text
      t.boolean :incoming

      t.timestamps
    end
  end
end
