class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      format.html { redirect_to @cocktail, notice: 'Upload success!'}
    else
      format.html { render action: 'new', notice: 'uh oh something went wrong, please try again' }
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
  end

  def update
    @cocktail = Cocktail.find(params[:id])
  end

  def destroy
    @cocktail = Cocktail.find(cocktail_params)
    @cocktail.delete
    redirect_to cocktail_index_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredient_id, :dose_id)
  end
end
