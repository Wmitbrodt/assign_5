class AddCategoryIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :category, index: true, foreign_key: true
  end
end
