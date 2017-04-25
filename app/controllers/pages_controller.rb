class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @tool = Tool.new
  end
end
