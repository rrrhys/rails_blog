class WelcomeController < ApplicationController
layout "fullwidth"
  def index
    @posts = Post.all
  end
end
