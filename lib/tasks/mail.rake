namespace :mailer do

  desc "Send weekly recording updates"
  task send_mail: :environment do
    User.find_each do |user|
      if user.gets_email?
        recordings = user.recordings.weekly
        UserMailer.notice_email(user, recordings).deliver
      end
    end
  end
end
