class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end


  def create
    @cocktail = Cocktail.new(cocktail_params)

    if @cocktail.save

      redirect_to root_path(@cocktail)
    else
      render :new
    end
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:cocktail).permit(:name)
  end
end
