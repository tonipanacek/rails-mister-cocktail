class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail
    else
      render 'new'
    end
  end

  protected

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end






  # def edit
  #   @cocktail = Cocktail.find(params[:id])
  # end

  # def update
  #   @cocktail = Cocktail.find(params[:id])
  #   if @cocktail.update
  #     redirect_to @cocktail
  #   else
  #     render 'edit'
  #   end
  # end

  # def delete
  #   @cocktail = Cocktail.find(params[:id])
  #   @cocktail.destroy
  # end
