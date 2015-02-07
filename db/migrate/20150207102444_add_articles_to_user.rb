class AddArticlesToUser < ActiveRecord::Migration
  def change
    add_column :articles, :user_id, :integer
  end
end
