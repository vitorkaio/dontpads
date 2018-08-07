class ApplicationController < ActionController::API

before_action :ensure_json_request

include ActionController::HttpAuthentication::Token::ControllerMethods
before_action :authenticate

	# trava a aplicação pra responde somente as chamadas que tenham o header accept 
	# aplication/json
	def ensure_json_request
		return if request.headers["Accept"] =~ /vnd\.api\+json/
		render :nothing => true, :status => 406
	end

	private

		 def authenticate
      authenticate_or_request_with_http_token do |token, options|
        hmac_secret = "@mend@"
        JWT.decode token, hmac_secret, true, { :algorithm => 'HS256' }
        # Compare the tokens in a time-constant manner, to mitigate
        # timing attacks.
        # ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
      end
    end

end
