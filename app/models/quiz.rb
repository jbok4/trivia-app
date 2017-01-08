class Quiz < ApplicationRecord
  has_many :trivia_questions

  before_action :set_quiz, except: [:index, :new, :create, :favorite]

  def index
    @quizzes = Quiz.all.order("created_at DESC")

  end

  def show
    @questions = Question.where(quiz_id: @quiz.id).order("created_at DESC")
    render json: @quiz
  end

  def new
    @quiz = Quiz.build
    @quiz.trivia_questions.build
  end

  def edit
  end

  def create
    @quiz = Quiz.build(quiz_params)
    if @quiz.save
      format.json { render :show, status: :created, location: @quiz }
    else
      format.json { render json: @quiz.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @quiz.update(quiz_params)
      format.json { render :show, status: :ok, location: @quiz }
    else
      format.json { render json: @quiz.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @quiz.destroy
  end




  private

   def set_quiz
       @quiz = Quiz.find(params[:id])
   end

    def quiz_params
      params.require(:quiz).permit(:correctAnswers, trivia_questions_attributes: [:type, :text, :possibilities, :selected, :correct])
    end

end
