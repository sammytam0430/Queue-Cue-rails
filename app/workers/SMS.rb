require 'twilio-ruby'

class SendSMS
  include Sidekiq::Worker

  def perform(record_id)
    # record = Collection.find record_id
    @twilio = Twilio::REST::Client.new "AC7ab395cf0ce20c1ded066a12beedde50", "dc296287605c92e8b55f7cdf68eda05"

    @twilio.account.messages.create(
      from: '+15005550006',
      to: '+15005550009',
      body: 'Hey there!  This is your reminder.'
    )
  end
end

SendSMS.perform_in(5.seconds)
