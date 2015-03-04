class RemoveUpvotesAndDownvotesFromSuggestions < ActiveRecord::Migration
  def change
    remove_column :suggestions, :upvotes, :integer
    remove_column :suggestions, :downvotes, :integer
  end
end
