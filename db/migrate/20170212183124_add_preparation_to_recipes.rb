class AddPreparationToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :preparation, :string
  end
end
