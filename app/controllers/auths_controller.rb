class AuthsController < ApplicationController

	def create
		# puts ">>>>>>>>>>> #{params}"
		# puts ">>>>>>>>>>> #{params[:name]}"

		# para adicionar tempo ao token. Add ao payload exp: tempo, 30 segs.
		#tempo = Time.now.to_i + 30

		hmac_secret = "@mend@"
		payload = {name: params[:name], password: params[:password]}#, exp: tempo}
		token = JWT.encode payload, hmac_secret, 'HS256'

		render json: {token: token}
	end

end
