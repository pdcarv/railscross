class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.text :description
      t.string :administration_time

      t.timestamps
    end
  end
end
