class WelcomeController < ApplicationController
  def index
    flash[:warning] = "早安，你好！"
    flash[:notice] = "xxxx"
    flash[:alert]= "ddd"
  end
end
