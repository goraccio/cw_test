class IndexController < ApplicationController
  before_action :authenticate_user!
  def home
    @comments = Comment.all.order(created_at: 'ASC')
  end
end
