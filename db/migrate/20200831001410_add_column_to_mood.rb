class AddColumnToMood < ActiveRecord::Migration[6.0]
  def change
    add_column :moods, :image, :string
  end
end
