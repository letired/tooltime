class PagesController < ApplicationController
  def home
    @tool = Tool.new
  end
end
