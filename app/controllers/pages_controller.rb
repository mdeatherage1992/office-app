class PagesController < ApplicationController

def home
  @orgs = Organization.all
end

end
