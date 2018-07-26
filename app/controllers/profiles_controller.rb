class ProfilesController < ApplicationController
  # GET request to /users/:user_id/profile/new
  def new
    # Render blank profile form
    @profile = Profile.new
  end
  
  # POST request to /users/:user_id/profile
  def create
    # Identify the user submitting the form
    @user = User.find( params[:user_id] )
    # Create profile for this user ID
    @profile = @user.build_profile( profile_params )
      if @profile.save
        flash[:success] = "Profile updated."
        redirect_to root_path
      else
        render action: :new
      end
  end
  
  private
    # Strong parameters to allow data collection from form and whitelists
    # the form fields
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
    end
end