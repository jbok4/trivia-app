class TriviaQuestionsController < ApplicationController
  before_action :set_trivia_question, only: [:show, :edit, :update, :destroy]
  before_action :set_quiz, except: [:index, :show]

  def index
    @trivia_questions = Trivia_question.all.order("created_at DESC")
    render json: @trivia_questions
  end

  def new
    @trivia_question = Trivia_question.new
  end

  def show
    @trivia_question = Trivia_question.find(params[:id])
    render json: @trivia_question, adapter: :json
  end

  def edit
  end

  def create
    @trivia_question = @quiz.trivia_questions.build(trivia_question_params)
    if @trivia_question.save
      render json: response
    else
      render json: { errors: @trivia_question.errors.full_messages }
    end
  end

  def update
    @trivia_question.update(trivia_question_params)
  end

  def destroy
    @trivia_question.destroy
    redirect_to root_path
  end



  private

    def set_trivia_question
      @trivia_question = Trivia_question.find(params[:id])
    end

    def set_quiz
      @quiz = Quiz.find(params[:quiz_id])
    end

    def trivia_question_params
      params.require(:trivia_question).permit(:type, :text, :possibilities, :selected, :correct)
    end
end