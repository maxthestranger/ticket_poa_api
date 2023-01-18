class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :cover_image
      t.integer :event_count, default: 0

      t.timestamps
    end
  end
end
