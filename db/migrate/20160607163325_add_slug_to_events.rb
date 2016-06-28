class AddSlugToEvents < ActiveRecord::Migration[5.0]
  def up
    add_column :events, :slug, :string
    add_index :events, :slug, unique: true

    Event.all.each do |e|
      e.slug = e.name.parameterize
      e.save
    end
  end

  def down
    remove_column :events, :slug
  end
end
