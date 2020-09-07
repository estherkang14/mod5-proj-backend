class AddNewColumnToDailyPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :daily_posts, :water, :integer
  end
end
