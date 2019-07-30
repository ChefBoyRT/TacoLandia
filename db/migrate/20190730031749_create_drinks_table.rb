class CreateDrinksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
    end
  end
end
