class Contato < ApplicationRecord
	# Associação ono_to_one entre Contatos e tipos.
	# optional: true indica que o tipo não é preciso ser especificado ao fazer o post.
	#belongs_to :tipo, optional: true
	belongs_to :tipo

	# Contato possui vários telefones. Quando for many tem que ser no plural.
	has_many :telefones, dependent: :destroy # cascade all.

	# Contato possui um endereco.
	has_one :endereco, dependent: :destroy

	# Permite adicionar/atualizar telefones quando criar/atualizar contatos.
	accepts_nested_attributes_for :telefones, allow_destroy: true # permite deletar telefone.
	accepts_nested_attributes_for :endereco, update_only: true # atualiza o campo e não cria.

	# Adicionando telefones.
	# params = {contato: {nome: "kaio", email: "kaio@email.com", datanascimento: "12/12/2012", tipo_id: 2, 
	# telefones_attributes: [ {numero: "33471252"}, {numero: "32984839267"} ] }}


	# method para fazer o merge nos atributos de resposta do render json
	def autor
		return "amenda"
	end

	def quantidade_telefones
		return self.telefones.count
	end

	# method que adiciona um campo com a descrição do tipo.
	def tipo_descricao
		self.tipo.descricao
 		# self pega a referência do contato atual.
		# puts self.nome
	end

	# Converte a datanascimento para o padrão pt-BR
	def data_nascimento
		# Só converte as data em que o campo é diferente de null.
		I18n.l(self.datanascimento) unless self.datanascimento.blank? 
	end

	def as_json(options={})
		h = super(options)
		h[:datanascimento] = I18n.l(self.datanascimento) unless self.datanascimento.blank? 
		return h
	end

	# Renderizar o json próprio com I18n.
	#def to_br
	#	{
	#		nome: self.nome,
	#		datanascimento: (I18n.l(self.datanascimento) unless self.datanascimento.blank?)
	#	}
	#end

	# Override do render json, todas as rotas irão retornar as ops passadas.
	#def as_json(options = {})
	#	super(
	#		methods: [:autor, :tipo_descricao], # Faz o merge de campos automaticamente.
			#root: true,
			#except: [:tipo_id], 
	#		include: {tipo: {only: :descricao}}
	#		)
	#end

end
