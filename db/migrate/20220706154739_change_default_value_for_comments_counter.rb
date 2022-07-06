class ChangeDefaultValueForCommentsCounter < ActiveRecord::Migration[5.2]
  def change
    change_column_default :posts, :comments_counter, 0
  end
end
