class DosesController < ApplicationController

  def delete
  end

  def new
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end

  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
