class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :destroy, :update]
  def index
    @questions = Question.all
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path, notice: 'Success!'
    else
      flash[:alert] = 'Save error!'
      render :new
    end
  end
  def edit
  end
  def destroy
    @question.destroy
    redirect_to root_path, notice: 'Success!'
  end
  def update
    if @question.update(question_params)
      redirect_to root_path, notice: 'Edit success!'
    else
      flash[:alert] = "Update error!"
      render :edit
    end
  end
  private
  def set_question
    @question = Question.find(params[:id])
  end
  def question_params
    params.require(:question).permit(:name, :title, :content)
  end
end
