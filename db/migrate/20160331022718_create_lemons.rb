class CreateLemons < ActiveRecord::Migration[5.0]
  def change
    create_table :lemons do |t|
      t.string :name
      t.string :species
      t.string :description

      t.timestamps
    end
  end
end
