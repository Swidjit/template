class PagesController < ApplicationController

  def home

  end

  def show
    render params[:page_name]
  end

  def sitemap

  end

end
