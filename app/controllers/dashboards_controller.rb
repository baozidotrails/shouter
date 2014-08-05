class DashboardsController < ApplicationController
  def show
    @text_shout = TextShout.new
    @photo_shout = PhotoShout.new
    @shouts = Shout.all
  end
end