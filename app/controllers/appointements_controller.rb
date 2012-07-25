class AppointementsController < ApplicationController
  before_filter :authenticate_admin!

  def new
    @patient = Patient.find(params[:patient_id])
    @appointement = @patient.new_appointement_with_last_prescription
  end

  def create
    @patient = Patient.find(params[:patient_id])
    @patient.appointements.build(params[:appointement])

    if @patient.save
      redirect_to patient_path(@patient) 
    else
      render :action => 'edit'
    end
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @appointement = @patient.appointements.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:patient_id])
    @appointement = @patient.appointements.find(params[:id])
    @appointement.update_attributes(params[:appointement])

    redirect_to patient_path(@patient)
  end

  def destroy
    @patient = Patient.find(params[:patient_id])
    @appointement = @patient.appointements.find(params[:id])
    @appointement.destroy

    redirect_to patient_path(@patient)
  end
end
