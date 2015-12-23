class ProjectsController < ApplicationController


  def show
    @project = Project.find_by_slug(params[:id])
    render params[:id].gsub('-','_')
  end

  def index
    @projects = Project.all.order(order: :desc)
  end

end
