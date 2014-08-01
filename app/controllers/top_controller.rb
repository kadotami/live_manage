class TopController < ApplicationController
  def index
    @title = "WUK Live Manage"
  end
  def error
    @title = "ERROR"
  end
end
