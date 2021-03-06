namespace :mailer do

  desc "Send weekly recording updates"
  task send_mail: :environment do
    if Date.today.wday == 0
      User.find_each do |user|
        if user.gets_email?
          recordings = user.recordings.within_past_week
          unless recordings.empty?
            UserMailer.notice_email(user, recordings).deliver
          end
        end
      end
    end
  end
end
