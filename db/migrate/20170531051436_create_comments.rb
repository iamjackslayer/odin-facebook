class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
    	t.text :content
    	t.integer :commenter_id, index: :true
    	t.integer :post_id, index: :true
      t.timestamps
    end
  end
end
