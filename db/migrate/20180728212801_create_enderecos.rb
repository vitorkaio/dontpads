class CreateEnderecos < ActiveRecord::Migration[5.2]
  def change
    create_table :enderecos do |t|
      t.string :cidade
      t.string :rua
      t.references :contato, foreign_key: true

      t.timestamps
    end
  end
end
