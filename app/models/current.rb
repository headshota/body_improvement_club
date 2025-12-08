class Current < ActiveSupport::CurrentAttributes
  attribute :http_method, :request_id, :user_agent, :ip_address, :referrer
end
