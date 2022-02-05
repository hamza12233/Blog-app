# frozen_string_literal: true

DeviseTokenAuth.setup do |config|
  config.token_cost = Rails.env.test? ? 4 : 10
  config.change_headers_on_each_request = false
  config.max_number_of_devices = 3
  config.check_current_password_before_update = :password
  config.default_callbacks = false
end
