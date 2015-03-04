class CreateDownvotes < ActiveRecord::Migration
  def change
    create_table :downvotes do |t|
      t.integer :user_id
      t.integer :suggestion_id

      t.timestamps null: false
    end
  end
end
