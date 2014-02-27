class ProfilesController < ApplicationController
  def show
    @user = User.find_by_profile_name(params[:id])
    if @user
      @statuses = @user.statuses.all
      render action: :show 
        # these two lines make certain that only the users statuses are displayed on their page. 
    else
      render file: "public/404", status: 404, formats: [:html]
    end
  end
end
