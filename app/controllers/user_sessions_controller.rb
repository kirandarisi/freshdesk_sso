class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_url = AppConfig['freshdesk_domain_name']+"login/sso?name="+current_user.username+"&email="+current_user.email+"&hash="+gen_hash_from_params_hash
      redirect_to redirect_url
    else
      puts @user_session.errors
      render :action => 'new'
    end
  end
  
  def gen_hash_from_params_hash
     Digest::MD5.hexdigest(current_user.username+current_user.email+AppConfig['freshdesk_sso_decret'])
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
end
