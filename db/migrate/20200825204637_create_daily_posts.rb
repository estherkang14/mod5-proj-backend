class CreateDailyPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_posts do |t|
      t.integer :user_id
      t.integer :mood_id
      t.date :date
      t.string :day
      t.integer :blurb_id

      t.timestamps
    end
  end
end
