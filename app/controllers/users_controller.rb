class UsersController < ApplicationController
def index
#@list_of_users =...
matching_users = User.all

@list_of_users = matching_users.order({:username => :asc})

render({:template =>"user_templates/index.html.erb"})

end
def show
# parameters: {"path_username" => "anisa"}
url_username = params.fetch("path_username")

matching_usernames = User.where({:username=> url_username})

@the_user = matching_usernames.at(0)
  #if @the_user == nil
   # redirect_to("/user",status:404)
   # or redirect_to("/404") we have 404.html inside public folder page here
  #else
    render({:template =>"user_templates/show.html.erb"})
    #end
  end
  def create
    input_record = params.fetch("insert_user_record")
  
    a_new_record = User.new
  
    a_new_record.username = input_record
  
  
    a_new_record.save
  
      #render({ :template => "photo_templates/create.html.erb"})
      redirect_to("/users/" + a_new_record.username.to_s )
    end
  
    def update
      the_name = params.fetch("modify_user")
      matching_users = User.where( :id => the_name)
      the_user_name = matching_users.at(0)
  
      input_username = params.fetch("input_username")
  
  
      the_user_name.username = input_username
      the_user_name.id = the_name
  
      the_user_name.save
      #Parameters: {"input_username"=>"er1", "modify_user"=>"138"}
      #render({ :template => "photo_templates/update.html.erb"})
      next_url = "/users/" + the_user_name.username.to_s
      redirect_to(next_url)
    end
  end
