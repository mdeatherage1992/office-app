class PagesController < ApplicationController

def home
  @new_org = Organization.new
  @orgs = Organization.all
end

end
