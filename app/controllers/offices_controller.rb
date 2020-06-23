class OfficesController < ApplicationController
  def index
    @offices = Office.all
  end

  def show
  end

  def new
  end

  def create
  end
end
