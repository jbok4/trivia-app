class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_quiz, except: [:index, :show]

  def index
    @questions = Question.all.order("created_at DESC")
    render json: @questions
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    render json: @question, adapter: :json
  end

  def edit
  end

  def create
    @question = Question.build(question_params)
    if @question.save
      render json: response
    else
      render json: { errors: @question.errors.full_messages }
    end
  end

  def update
    @question.update(question_params)
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end



  private

    def set_question
      @question = Question.find(params[:id])
    end

    def set_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end

    def question_params
      params.require(:question).permit(:type, :text, :possibilities, :selected, :correct)
    end
end