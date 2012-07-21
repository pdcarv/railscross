class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :nationality
      t.integer :identification_card_number
      t.integer :age
      t.string :sex
      t.integer :national_healthcare_number
      t.text :diseases
      t.text :alergys

      t.timestamps
    end
  end
end
