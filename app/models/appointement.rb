class Appointement < ActiveRecord::Base
  attr_accessible :change_medication, :date, :notes, :prescriptions_attributes 

  belongs_to :patient
  has_many :prescriptions
  
  accepts_nested_attributes_for :prescriptions, :allow_destroy => true
  before_save :prescriptions_changed?

  def prescriptions_changed?
    lp = self.patient.last_appointement.prescriptions 
    tp = self.prescriptions

    return (self.change_medication = true)  if lp.size <=> tp.size

    # Note: for here on to the end of this method I am
    # ashamed of myself, for now the clock is ticking
    # and this is the fastest way to do this, not the most efficient
    lp = lp.order("description")
    tp = tp.order("description")
   
    # if the lists are of the same size then we need to go 
    # deeper and check every field
    lp.zip(tp).each do |lp, tp|
      administration_changed = lp.administration_time != tp.administration_time
      description_changed = lp.description != tp.description

      if administration_changed or description_changed
        self.change_medication = true
      end
    end
  end
end
