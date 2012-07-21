class Medication < ActiveRecord::Base
  attr_accessible :administration_time, :description

  belongs_to :appointement
end
