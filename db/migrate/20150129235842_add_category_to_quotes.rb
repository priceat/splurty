class AddCategoryToQuotes < ActiveRecord::Migration
  def change
     add_column :quotes, :category_id, :integer
      add_index :quotes, :category_id
  end
end
