class ContatoSerializer < ActiveModel::Serializer
  attributes :id, :nome, :email, :datanascimento, :quantidade_telefones, :autor

  # envia os relacionamentos da tabela contatos.
  belongs_to :tipo
	has_many :telefones
	has_one :endereco

	# adicionando link.
	# link pra ele mesmo.
	#link(:self) { contato_path(object.id) }

	# set Rails.application.routes.default_url_options em config/env/dev.rb
	#link(:self) { contato_url(object.id) }
	#link(:tipo) { tipo_path(object.tipo.id) }
	#link(:tipo) { tipo_url(object.tipo.id) }

	def autor
		return "Kaio"
	end

	# define uma meta inforção pra todos.
	meta do
		{autor: "sir_kaio"}		
	end

  def attributes(*args)
		h = super(*args)
		# data em pt-br
		h[:datanascimento] = I18n.l(object.datanascimento) unless object.datanascimento.blank? 
		
		# data no padrão iso 8601
		#h[:datanascimento] = object.datanascimento.to_time.iso8601 unless object.datanascimento.blank? 
		return h
	end
end
