class UserMailer < ActionMailer::Base
  default from: "reLIVEit noreply@reliveit.herokuapp.com"

  def notice_email(user, recordings)
    @user = user
    @recordings = recordings
    mail(to: @user.email, subject: "There are new recordings available!")
  end

end
