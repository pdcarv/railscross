class PatientController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @patients = Patient.all
  end
end
