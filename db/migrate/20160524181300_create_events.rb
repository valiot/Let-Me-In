class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.string :image_id
      t.string :image_filename
      t.datetime :starts_at
      t.datetime :finishes_at

      t.timestamps
    end
  end
end
