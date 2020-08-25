class CreateBlurbs < ActiveRecord::Migration[6.0]
  def change
    create_table :blurbs do |t|
      t.text :thankful
      t.text :struggle
      t.text :day_summary

      t.timestamps
    end
  end
end
