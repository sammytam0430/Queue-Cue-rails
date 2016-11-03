class TableReadyJob < ApplicationJob
  queue_as :default

  def perform(phone)
    begin
    @twilio = Twilio::REST::Client.new "ACb76b80438efa4584b03a7e1b88555695", "452220120c95611275e3ad5d32346e31"

    @twilio.account.messages.create(
      from: +17786550593,
      to: '+1' + phone,
      body: "Your table is ready! You have 10 minutes to be at the restaurant"
    )
    rescue Twilio::REST::RequestError => e
    logger.debug "error: #{e.message}"
    end
  end
end
