class UserMailer < ActionMailer::Base

  default from: "ysuwansiri@gmail.com"

  def registration_confirmation()
    mail(to: "ysuwansiri@yahoo.com", subject: "Registered")
  end
end
