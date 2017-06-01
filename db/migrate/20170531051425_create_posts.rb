class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
     	t.integer :author_id, index: :true
     	t.text :content
     	t.integer :number_of_likes
      t.timestamps
    end
    
  end
end
