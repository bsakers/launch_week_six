class MembersController < ApplicationController
  def index
  end

  def new
    @house = House.find(params[:house_id])
    @member = Member.new
  end

  def create
    @house = House.find(params[:house_id])
    @member = Member.create(member_params)
    @member.house = @house
    if @member.save
      redirect_to @house, notice: "Member added successfully"
    else
      flash[:alert] = @member.errors.full_messages.join(' , ')
      render :new
    end
  end

  private

   def member_params
     params.require(:member).permit(:first_name, :last_name)
   end
end
