class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: %i[ show edit update destroy ]
  before_action :set_questions, only: %i[ new create edit ]

  # GET /answers or /answers.json
  def index
    # TODO: validate if required this implementation here else remove.
    @answers = params[:question_id] ? Answer.where(question_id: params[:question_id]) : @answers = Answer.all
    @pagy, @answers = pagy(@answers, items: 8)
  end

  # GET /answers/1 or /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers or /answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to answer_url(@answer), notice: "Answer was successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new, status: :unprocessable_entity, location: @answer }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to answer_url(@answer), notice: "Answer was successfully updated." }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy

    respond_to do |format|
      format.html { redirect_to answers_url, notice: "Answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_questions
    @questions = Question.all
  end

  # Only allow a list of trusted parameters through.
  def answer_params
    params.require(:answer).permit(:title, :body, :status, :question_id)
  end
end
