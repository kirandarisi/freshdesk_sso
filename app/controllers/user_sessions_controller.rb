require 'openssl'

class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      utctime = time_in_utc
      redirect_url = AppConfig['freshdesk_domain_name']+"login/sso?name="+current_user.username+"&email="+current_user.email+"&timestamp="+utctime+"&hash="+gen_hash_from_params_hash(utctime)
      redirect_to redirect_url
    else
      puts @user_session.errors
      render :action => 'new'
    end
  end
  
  def gen_hash_from_params_hash(utctime)
    digest  = OpenSSL::Digest::Digest.new('MD5')
     OpenSSL::HMAC.hexdigest(digest,AppConfig['freshdesk_sso_decret'],current_user.username+current_user.email+utctime)
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to root_url
  end
  private

  def time_in_utc
    Time.now.getutc.to_i.to_s
  end
end
