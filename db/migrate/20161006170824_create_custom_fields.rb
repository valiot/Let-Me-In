class CreateCustomFields < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_fields do |t|
      t.integer :type
      t.string :name
      t.string :options

      t.timestamps
    end
  end
end
