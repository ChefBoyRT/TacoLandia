class CreateMealsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.references :taco, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
