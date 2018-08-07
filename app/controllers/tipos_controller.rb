class TiposController < ApplicationController

  # adiciona auth na rota tipos, é necessário um token pra acessar a rota.
  #TOKEN = "secret123"
  #http_basica_authenticate_with name: "amendas", password: "123"
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate
  
  before_action :set_tipo, only: [:show, :update, :destroy]

  # GET /tipos
  def index
    @tipos = Tipo.all

    render json: @tipos
  end

  # GET /tipos/1
  def show
    render json: @tipo
  end

  # POST /tipos
  def create
    @tipo = Tipo.new(tipo_params)

    if @tipo.save
      render json: @tipo, status: :created, location: @tipo
    else
      render json: @tipo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tipos/1
  def update
    if @tipo.update(tipo_params)
      render json: @tipo
    else
      render json: @tipo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tipos/1
  def destroy
    @tipo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo
      @tipo = Tipo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tipo_params
      params.require(:tipo).permit(:descricao)
    end

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
