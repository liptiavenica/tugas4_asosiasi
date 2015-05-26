class UserMailer < ApplicationMailer
	default :from =>  'liptiavenica@gmail.com'

	def send_signup_email()
     mail(:to =>  'ninikcancer.tgl@gmail.com', :subject =>  'Welcome to My Awesome Site')
    end
end
