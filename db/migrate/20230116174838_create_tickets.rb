class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price
      t.text :detail
      t.boolean :sold_out
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
