class PatientsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find(params[:id])
    @appointements = @patient.appointements.order('created_at DESC')
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create(params[:patient])
    redirect_to patient_path(@patient)
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    @patient.update_attributes(params[:patient])

    redirect_to patient_path(@patient)
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    redirect_to patients_path
  end
end
