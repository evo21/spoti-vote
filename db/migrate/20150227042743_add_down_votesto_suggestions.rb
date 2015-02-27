class AddDownVotestoSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestions, :downvotes, :integer, default: 0
  end
end
