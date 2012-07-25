class Patient < ActiveRecord::Base
  attr_accessible :age, :alergys, :diseases, :identification_card_number, :name, :national_healthcare_number, :nationality, :sex, :appointements_attributes

  has_many :appointements
  has_many :prescriptions, :through => :appointements
  accepts_nested_attributes_for :appointements, :allow_destroy => true

  def last_appointement_date
    appointements.last.date
  end

  def last_appointement
    appointements.last
  end

  def new_appointement_with_last_prescription
    _la = self.appointements.last(:include => :prescriptions)
    _lp = _la.prescriptions unless _la.nil?

    new_appointement = self.appointements.new

    # if there is no last appointement there are no appointements
    # therefore there are no previously prescribed medication
    return new_appointement if _la.nil? or _lp.blank?
    
    # give it the same medication as the last appointement
    new_appointement.prescriptions = _lp.map(&:dup)

    new_appointement
  end
end
