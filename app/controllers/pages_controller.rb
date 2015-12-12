class PagesController < ApplicationController

  def home

  end

  def show
    render params[:page_name]
  end

  def resume
    render :layout=>'full'
  end

  def sitemap

  end

end
