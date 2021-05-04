class AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.new
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: '回答しました!'
    else
      redirect_to question_path(@question), alert: '回答に失敗しました...'
    end
  end
  def update
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    if @answer.update(answer_params)
      redirect_to question_path(@question), notice: '回答を変更しました'
    else
      redirect_to question_path(@question), alert: '回答の変更に失敗しました'
      
    end
  end
  def edit
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
  end
  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question), notice: 'Success!'
  end

  private
    def answer_params
      params.require(:answer).permit(:name, :content, :question_id)
    end
end
