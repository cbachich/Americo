class StaticPagesController < ApplicationController
  def home
    @company = Company.first
  end
end
