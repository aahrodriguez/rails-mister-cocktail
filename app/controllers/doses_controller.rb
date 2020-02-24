class DosesController < ApplicationController

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to cocktails_path
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  private

  def dose_params
    # *Strong params*: You need to *whitelist* what can be updated by the user
    # Never trust user data!
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
