class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.boolean :offline
      t.text :description
      t.string :venue_url
      t.string :venue_name
      t.string :poster
      t.string :video_url
      t.timestamp :start_date
      t.timestamp :end_date
      t.boolean :live
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
