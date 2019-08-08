class DosesController < ApplicationController

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])

     if @dose.save
       redirect_to dose_path(@dose)
     else
       render 'cocktails/show'
     end
  end

  def destroy
    @dose = Patient.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :quantity)
  end
end
