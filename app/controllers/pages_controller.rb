class PagesController < ApplicationController

def home
  if user_signed_in?
  @new_org = Organization.new
  @orgs = Organization.all
else
  redirect_to new_user_session_path
  end
end

end
