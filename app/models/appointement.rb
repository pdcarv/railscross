class Appointement < ActiveRecord::Base
  attr_accessible :change_medication, :date, :notes

  belongs_to :patient
  has_many :medications
end
