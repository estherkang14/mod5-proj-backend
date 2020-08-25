class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :type
      t.date :start_date
      t.date :end_date
      t.text :notes
      t.boolean :completed

      t.timestamps
    end
  end
end
