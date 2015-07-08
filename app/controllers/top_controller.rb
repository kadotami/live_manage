class TopController < ApplicationController
  def index
    @title = "WUK Live Manage"
    unless signed_in?
      redirect_to '/sessions/new'
    end
  end
  def error
    @title = "ERROR"
  end
end
