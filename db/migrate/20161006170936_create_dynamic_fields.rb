class CreateDynamicFields < ActiveRecord::Migration[5.0]
  def change
    create_table :dynamic_fields do |t|
      t.belongs_to :event, foreign_key: true
      t.belongs_to :custom_field, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
