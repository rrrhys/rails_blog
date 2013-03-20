class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.belongs_to :user
      t.string :urltext

      t.timestamps
    end
    add_index :posts, :user_id
  end
end
