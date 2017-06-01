class ChangeColumnInPosts < ActiveRecord::Migration[5.0]
  def change
  	change_column :posts, :number_of_likes, :integer, default: 0
  end
end
