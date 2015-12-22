class WelcomeController < ApplicationController
  protect_from_forgery except: :auth_callback
  def index
    @user = Steam.where(:uid => session[:uid]).first
    @matchlist = []
    if session.key? :uid
      url = URI.parse("http://api.steampowered.com/IDOTA2Match_570/GetMatchHistory/v001/?key=#{ENV['STEAM_WEB_API_KEY']}&account_id=#{@user.uid}")
      url1 = URI.parse("http://api.steampowered.com/IDOTA2Match_570/GetMatchDetails/V001/?key=#{ENV['STEAM_WEB_API_KEY']}&match_id=2021039241")
      res = Net::HTTP::get(url)
      res1 = Net::HTTP::get(url1)
      @matchlist = JSON.load(res)['result']['matches'] || []
      @hello = JSON.load(res1)
    end
  end

  def auth_callback
    auth = request.env['omniauth.auth']
    session[:uid] = auth.uid
    user = Steam.where(:uid => auth.uid).first
    if user == nil
      new_steam = Steam.new(:image_url => auth.info['image'],:nickname => auth.info['nickname'],:uid => auth.uid )
      new_steam.save
      redirect_to index_path
    else
      redirect_to index_path
    end
  end

  def reset
    reset_session
    redirect_to index_path
  end


end
