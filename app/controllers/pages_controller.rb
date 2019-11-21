class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    FakeJob.perform_later
  end
end
