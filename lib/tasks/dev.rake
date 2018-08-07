namespace :dev do
  desc "Inicializa o banco de dados da aplicação"
  task setup: :environment do

  	puts "Cadastrando tipos de contatos..."
  	tipos = ['Pessoal', "Comercial", "Familiar", "Trabalho"]

  	tipos.each do |tipo|
  		# create! faz a mudança insta no objeto.
  		Tipo.create!(
  			descricao: tipo
  		)
  	end

  	puts "Cadastrando contatos..."
  	100.times do |x|
  		contato = Contato.new(
  			nome: Faker::Name.name,
  			email: Faker::Internet.email,
  			datanascimento: Faker::Date.between(60.years.ago, Date.today), #=> "Wed, 24 Sep 2014"
  			tipo: Tipo.all.sample
  		)
  		contato.save
  	end

    puts "Cadastrando telefones..."
    Contato.all.each do |contato|
      Random.rand(6).times do |x|
        tel = Telefone.new(
          numero: Faker::PhoneNumber.cell_phone,
          contato: contato
        )
        tel.save
        contato.telefones << tel
        contato.save!
      end
    end

    puts "Cadastrando endereço..."
    Contato.all.each do |contato|
      endereco = Endereco.new(
        cidade: Faker::Address.city,
        rua: Faker::Address.street_address,
        contato: contato
      )
      endereco.save!
    end

  end

end
