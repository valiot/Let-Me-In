class AddBoleanIdToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :boletia_id, :int
  end
end
