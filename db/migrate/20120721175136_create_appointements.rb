class CreateAppointements < ActiveRecord::Migration
  def change
    create_table :appointements do |t|
      t.text :notes
      t.datetime :date
      t.boolean :change_medication

      t.timestamps
    end
  end
end
