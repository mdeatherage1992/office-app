class ShiftsController < ApplicationController

def create
  @shift = Shift.new(shift_params)
  @shift.save!
  redirect_to view_shifts_path(current_user.organization_id)
end

def edit
  @shift = Shift.find(params[:id])
end

def update
  @shift = Shift.find(params[:id])
  @shift.update_attributes(shift_params)
  @shift.save
  redirect_to view_shifts_path(current_user.organization_id)
  flash[:message] = "Updated Shift"
end

def destroy
  @shift = Shift.find(params[:id])
  @shift.destroy
  redirect_to view_shifts_path(current_user.organization_id)
  flash[:message] = "Deleted Shift"
end

private
def shift_params
  params.require(:shift)
  .permit(:start,:finish,:break_length,:user_id)
end
end
