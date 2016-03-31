class CreatePrivateData < ActiveRecord::Migration[5.0]
  def change
    create_table :private_data do |t|
      t.string :name
      t.string :ssn
      t.datetime :dob

      t.timestamps
    end
  end
end
