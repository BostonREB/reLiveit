class UserMailer < ActionMailer::Base
  default from: "reLIVEit noreply@reliveit.herokuapp.com"

  def notice_email(user)
    @user = user
    mail(to: @user.email, subject: "There are new recordings available!")
  end

end
