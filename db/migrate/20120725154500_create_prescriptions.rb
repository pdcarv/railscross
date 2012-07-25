class CreatePrescriptions < ActiveRecord::Migration
  def change
    create_table :prescriptions do |t|
      t.references :appointement
      t.string :administration_time
      t.string :description

      t.timestamps
    end
  end
end
