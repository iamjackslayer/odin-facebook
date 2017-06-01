class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :first_id
      t.integer :second_id

      t.timestamps
    end
  end
end
