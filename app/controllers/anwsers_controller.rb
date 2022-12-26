class AnwsersController < ApplicationController
  before_action :set_params

  def create
    @anwser = Anwser.create(question_id: params[:question_id], body: params[:body])

    respond_to do |format|
      if @anwser.save
        format.html do
          redirect_to user_question_path(user_id: @question.user.id, id: @question.id),
                      notice: 'Anwser was successfully created.'
        end
      else
        format.html do
          redirect_to user_question_path(user_id: @question.user.id, id: @question.id),
                      notice: 'Errors while anwser creating.'
        end
      end
    end
  end

  private
  def set_params
    @user = User.find(params[:user_id])
    @question = Question.find(params[:question_id])
  end

  def anwser_params
    params.require(:anwser).permit(:question_id, :body)
  end
end
