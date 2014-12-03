class CreateTypePosts < ActiveRecord::Migration
  def change
    create_table :type_posts do |t|
      t.string :name

      t.timestamps
    end
  end
end
