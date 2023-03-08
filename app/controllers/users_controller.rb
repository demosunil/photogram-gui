class UsersController < ApplicationController
def index
#@list_of_users =...
matching_users = User.all
@list_of_users = matching_users.order({:username => :asc})
  render({:template =>"user_templates/index.html.erb"})

end
def show
# parameters: {"path_username" => "anisa"}
url_username =params.fetch("path_username")
matching_usernames = User.where({:username=> url_username})
@the_user = matching_usernames.at(0)
  #if @the_user == nil
   # redirect_to("/user",status:404)
   # or redirect_to("/404") we have 404.html inside public folder page here
  #else
    render({:template =>"user_templates/show.html.erb"})
    #end
  end
  end
