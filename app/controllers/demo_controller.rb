class DemoController < ApplicationController
  before_action :is_admin?
  
  def show
  end
end
