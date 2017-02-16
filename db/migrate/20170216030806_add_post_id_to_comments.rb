class AddPostIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :post, index: true, foreign_key: true
  end
end
