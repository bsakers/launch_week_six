class HousesController < ApplicationController

  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def create
    @house = House.create(house_params)
    if @house.save
      redirect_to @house, notice: "House added successfully"
    else
      flash[:alert] = @house.errors.full_messages.join(' , ')
      render :new
    end
  end

  def show
    @house = House.find(params[:id])
    @members = @house.members
  end

private

 def house_params
   params.require(:house).permit(:name, :author, :source, :motto)
 end
end
