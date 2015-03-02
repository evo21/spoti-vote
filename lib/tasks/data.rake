namespace :data do
  desc "Resets vote counts and suggestion list if it is friday"
  task  refresh: :environment do

    if Time.now.friday? 
      # reset the vote count on all users
      User.all.each do |u|
        u.votes = 20
        u.save
      end

      #delete all suggestions
      #delete all upvotes and downvotes
    end

  end
end
