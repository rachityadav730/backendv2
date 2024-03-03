class Api::V1::HomeController < ApplicationController
    include DeviseTokenAuth::Concerns::SetUserByToken

    def index
        render json: { login: 123 }
    end

    def send_otp
        p "print mobile number",params
        otp = generate_otp
        # user.update(otp: otp)
        send_otp_via_sms(+917011819905, otp)
        render json: { message: 'OTP sent successfully' }

    end

    private

    def generate_otp
      # Generate a random 6-digit OTP
      rand(100_000..999_999).to_s
    end
  
    def send_otp_via_sms(phone_number, otp)
      # Send OTP using Twilio
      client = Twilio::REST::Client.new
      message = client.messages.create(
        # from: +12347424110,
        to: phone_number,
        body: "Your OTP is: #{otp}"
      )
    end
end
