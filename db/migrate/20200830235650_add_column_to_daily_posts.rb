class AddColumnToDailyPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :daily_posts, :thankful, :text
    add_column :daily_posts, :struggle, :text
    add_column :daily_posts, :summary, :text
  end
end
