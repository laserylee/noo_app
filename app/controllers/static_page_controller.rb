class StaticPageController < ApplicationController
  def home
    flash.now[:success] = "SUCCESS!!!"
  end

  def help
  end

  def about
  end

  def mission
  end

  def contact
  end
end
