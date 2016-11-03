require 'twilio-ruby'

class MakeReservationJob < ApplicationJob
  queue_as :default

  def perform(phone, time, restaurant_name)
    begin
    @twilio = Twilio::REST::Client.new "ACb76b80438efa4584b03a7e1b88555695", "452220120c95611275e3ad5d32346e31"

    @twilio.account.messages.create(
      from: +17786550593,
      to: '+1' + phone,
      body: "Thanks for entering the queue for #{restaurant_name}. Your wait time is approximately #{time} minutes"
    )
  rescue Twilio::REST::RequestError => e
  logger.debug "error: #{e.message}"
  end
  end
end
