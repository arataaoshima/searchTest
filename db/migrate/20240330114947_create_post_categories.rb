class CreatePostCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :post_categories do |t|
      t.integer :category_id
      t.integer :post_id

      t.timestamps
    end
  end
end
