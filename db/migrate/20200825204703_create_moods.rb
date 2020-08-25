class CreateMoods < ActiveRecord::Migration[6.0]
  def change
    create_table :moods do |t|
      t.string :title
      t.string :color
      t.string :hexcode

      t.timestamps
    end
  end
end
