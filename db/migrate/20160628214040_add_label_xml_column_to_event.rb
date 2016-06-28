class AddLabelXmlColumnToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :label_xml, :text
  end
end
