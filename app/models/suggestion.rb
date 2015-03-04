class Suggestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :playlist
  has_many :upvotes
  has_many :downvotes
end
