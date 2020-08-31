class CreateHolidays < ActiveRecord::Migration[6.0]
  def change
    create_table :holidays do |t|
      t.string :title
      t.date :start_date
      t.date :end_date 
      t.text :notes 

      t.timestamps
    end
  end
end
