class DosesController < ApplicationController

	def new
	  @dose = Dose.new
	  @cocktail = Cocktail.find(params[:cocktail_id])
	end

	def create
	  @dose = Dose.new(dose_params)
      @cocktail = Cocktail.find(params[:cocktail_id])
      @dose.cocktail = @cocktail
    if @dose.save
     redirect_to cocktail_path(@cocktail)
    else
     render :new
	end
	end



	private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
