class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params.merge(cocktail_id: params[:cocktail_id]))
    if @dose.save
      redirect_to @cocktail
    else
      render 'new'
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:ingredient_id])
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    @dose = Dose.find(params[:id, :cocktail_id, :ingredient_id])
    @dose.destroy
    redirect_to root_path
  end

  protected

  def dose_params
    params.require(:dose).permit(:description)
  end
end
