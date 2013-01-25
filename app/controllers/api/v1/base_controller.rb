module Api::V1
  class BaseController < ApiController
    private
    def current_user
      if doorkeeper_token
        @current_user ||= User.find(doorkeeper_token.resource_owner_id)
      end
    end
  end
end
