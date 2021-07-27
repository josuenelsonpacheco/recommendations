class HammerUsersController < ApplicationController
  def index
    #
    #params.each do |key,value|
    #  Rails.logger.warn "Param #{key}: #{value}"
    #end
    request.path_parameters
    request.query_parameters
    get_params = request.GET
    post_params = request.POST
    username = get_params[:username]
    
    #Rails.logger.warn "GET username Param: #{username}"

    @users = User.where(name: username)
    render json: @users
  end
end
