class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @offices = Office.pluck(:address).sort
  end
end
