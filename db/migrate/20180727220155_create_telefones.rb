class CreateTelefones < ActiveRecord::Migration[5.2]
  def change
    create_table :telefones do |t|
      t.string :numero
      t.references :contato, foreign_key: true

      t.timestamps
    end
  end
end
