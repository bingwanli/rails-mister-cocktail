class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses.all
  end

  def new
    @cocktail = Cocktail.new
    @doses = @cocktail.doses.build
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      params[:cocktail][:doses_attributes] do |d|
        @dose = Dose.create!(:cocktail_id => @cocktail.id, :ingredient_id => d.ingredient.id, :description => d.description)
      end
      redirect_to cocktails_path
    else
      format.html { render action: 'new' }
    end
  end

  def update
    @cocktail = Cocktail.find(params[:id])
  end

  def destroy
    @cocktail = Cocktail.find(cocktail_params)
    @cocktail.delete
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(
      :name,
      doses_attributes: [:id, :cocktail_id, :ingredient_id, :description]
    )
  end
end
