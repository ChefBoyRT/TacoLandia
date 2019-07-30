class CreateTacosTable < ActiveRecord::Migration[5.2]
  def change
    create_table :tacos do |t|
      t.string :name
      t.string :protein
      t.integer :heat_level
      t.string :shell_type
      t.references :drink, foreign_key: true
    end
  end
end