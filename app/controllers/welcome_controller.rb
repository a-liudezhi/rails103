class WelcomeController < ApplicationController
   def index
     flash[:notice] = "早安！你好! "
     flash[:alert] = "晚安！该睡了！"
     flash[:warning] = "这是warning信息！"
  end
end
