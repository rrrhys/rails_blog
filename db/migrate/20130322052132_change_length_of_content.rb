class ChangeLengthOfContent < ActiveRecord::Migration
 change_column :posts, :content, :text, :limit => nil
end
