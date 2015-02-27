class AddVotesToSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestions, :votes, :integer, default: 0
  end
end
