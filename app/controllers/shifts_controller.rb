class ShiftsController < ApplicationController

def create
  binding.pry
  @shift = Shift.new(shift_params)
  @shift.save!
  redirect_to view_shifts_path(params[:id])
end

private
def shift_params
  params.require(:shift).permit(:start,:finish,:break_length,:user_id)
end
end
