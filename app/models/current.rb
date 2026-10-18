class Current < ActiveSupport::CurrentAttributes
  attribute :http_method, :request_id, :user_agent, :ip_address, :referrer
  attribute :session
  delegate :user, to: :session, allow_nil: true
end
