class OrganizationsController < ApplicationController

def join
  org = Organization.find(params["organization_id"].to_i)
  current_user.organization_id = org.id
  current_user.save!
  redirect_to root_path
  flash[:message] = "Successfully Added you to #{org.name}"
end

def show
end

def create
  @org = Organization.create(organization_params)
  current_user.organization_id = @org.id
  current_user.save!
  redirect_to root_path
  flash[:message] = "Successfully Created #{@org.name} & Added you."
end

def edit
  @org = Organization.find(params[:id])
end

def update
  @org = Organization.find(params[:id])
  @org.assign_attributes(organization_params)
  @org.save!
  redirect_to root_path
  flash[:message] = "Successfully Updated #{@org.name}"
end

def view_shifts
  @q = current_user.organization.shifts.ransack(params[:q])
  @shifts = @q.result.includes(:user).order(:start).reverse
  @shift = Shift.new
end

def leave_organization
  org = Organization.find(params["organization_id"].to_i)
  shifts = Shift.where(user_id: current_user.id)
  shifts.delete_all
  current_user.organization_id = nil
  current_user.save!
  redirect_to root_path
  flash[:message] = "Successfully Left #{org.name}"
end


private
def organization_params
  params.require(:organization).permit(:name,:rate)
end

end
