class ContatosController < ApplicationController

  # ** Executa os métodos passados antes das rotas definidas. middlwares. 
  before_action :set_contato, only: [:show, :update, :destroy, :telefones]
  before_action :auths

  # GET /contatos
  def index
    # @contatos = Contato.all

    # Paginação. per -> retorna 5.
    @contatos = Contato.all.page(params[:page]).per(5)  

    # ** Mostra a raiz no json enviado, no caso, contato.
    # render json: @contatos, root: true

    # ** Retorna apenas os campos nome e email.
    # render json: @contatos, only: [:nome, :email]

    # ** Retorna todos os campo exceto created_at e updated_at.
    # render json: @contatos, except: [:created_at, :updated_at]

    # ** Adiciona um campo na resposta json, no caso adiciona autor em todas as respostas.
    # render json: @contatos.map { |c| c.attributes.merge({ autor: "Amendas" }) }

    # ** Adiciona method para fazer o merger auto, declare o method no model.
    # render json: @contatos, methods: :autor

    # ** Faz a associação com outra tabela e mostra os dados.
    # render json: @contatos, include: :tipo

    # ** Faz associação entre as tabelas e só mostra um campo da mesma.
    # render json: @contatos, include: {tipo: {only: :descricao}}

    # render json: @contatos, methods: :data_nascimento

    render json: @contatos, except: [:datanascimento], include: [:telefones, :endereco]
  end

  # GET /contatos/1
  def show
    # render json: @contato.attributes.merge({ teste: "teste" })
    # render json: @contato.to_br
    # methods: [:quantidade_telefones] , include: [:tipo, :telefones, :endereco]
    # render json: @contato, meta: { about: "json_api" }

    render json: @contato
  end

  # GET /contatos/:id/telefones: mostra os telefones do contato.
  def telefones
    telefones = @contato.telefones
    qtd = telefones.count

    render json: telefones

  end

  # POST /contatos
  def create
    @contato = Contato.new(contato_params)

    if @contato.save
      # Por baixo dos panos o render json faz: @contato.as_json.to_json
      render json: @contato, include: [:tipo, :telefones], status: :created, location: @contato
    else
      render json: @contato.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contatos/1
  def update
    if @contato.update(contato_params)
      render json: @contato, include: [:tipo, :telefones]
    else
      render json: @contato.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contatos/1
  def destroy
    @contato.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Método que é executado sempre que as rotas definidas são disparadas.
    def set_contato
      @contato = Contato.find(params[:id])
      #puts "\n\n AMENDA \n\n"
    end

    def auths
      authenticate()
    end

    # Only allow a trusted parameter "white list" through.
    # Lista de params permitidos.
    def contato_params
      params.require(:contato).permit(:nome, :email, :datanascimento, 
        :tipo_id, telefones_attributes: [:id, :numero, :_destroy],
        endereco_attributes: [:id, :cidade, :rua, :_destroy])
      # Para deletar um item nested, adicione _destroy e o id na requisição patch.

      # como está sendo usado o ams, estão deve usar a deserialization
      #ActiveModelSerializers::Deserialization.jsonapi_parse(params)
    end
end
