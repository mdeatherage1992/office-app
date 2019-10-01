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
  @shift = Shift.new
end

def leave_organization
  org = Organization.find(params["organization_id"].to_i)
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
