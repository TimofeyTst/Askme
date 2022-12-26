class AnwsersController < ApplicationController
  before_action :set_params

  def create
    return unless have_permission?

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

  def destroy
    return unless have_permission?

    Anwser.where(question_id: params[:question_id]).destroy_all

    respond_to do |format|
      format.html { redirect_to user_path(@user), notice: 'Anwser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def have_permission?
    @question.user == current_user
  end

  def set_params
    @user = User.find(params[:user_id])
    @question = Question.find(params[:question_id])
  end

  def anwser_params
    params.require(:anwser).permit(:question_id, :body)
  end
end
