class UsersController < ApplicationController
  # FIXME: We are leaking sensitive User information in this API, use the UserPresenter class in the index + show methods
  def index
    users = User.order(:id)
    render json: users.all
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  # OPTIMIZE: Possible N+1 issue, check Bullet logs
  def feedback
    user = User.find(params[:id])
    render json: UserFeedbackPresenter.collection(user.feedbacks)
  end
end
