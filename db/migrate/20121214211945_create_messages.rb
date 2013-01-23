class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :text
      t.integer :price
      t.boolean :payed

      t.timestamps
    end
  end
end
