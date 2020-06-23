class OfficesController < ApplicationController
  def index
    if params[:search].nil? || params[:search] == ""
      @offices = Office.all
    else
      @offices = Office.where(address: params[:search])
    end
  end

  def show
  end

  def new
  end

  def create
  end
end
