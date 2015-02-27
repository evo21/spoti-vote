class ChangeVotesToUpvotes < ActiveRecord::Migration
  def change
    rename_column :suggestions, :votes, :upvotes
  end
end
