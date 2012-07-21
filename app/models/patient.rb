class Patient < ActiveRecord::Base
  attr_accessible :age, :alergys, :diseases, :identification_card_number, :name, :national_healthcare_number, :nationality, :sex

  has_many :appointements
  has_many :medications, :through => :appointements
end
