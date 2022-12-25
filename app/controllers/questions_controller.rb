class QuestionsController < ApplicationController
  before_action :set_user

  # POST /questions or /questions.json
  def create
    @question = @user.questions.create(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to user_path(@user), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { redirect_to user_path(@user), notice: 'Errors while question creating' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question = @user.questions.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to user_path(@user), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  # Only allow a list of trusted parameters through.
  def question_params
    params.require(:question).permit(:user_id, :body)
  end
end
