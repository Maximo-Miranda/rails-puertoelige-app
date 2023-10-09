class ResponseQuestionController < ApplicationController
  def index
    if validate_response_exist?
      return respond_to do |format|
        format.html { redirect_to response_question_show_path(params[:question_id]) }
        format.json { render json: @response_question.errors, status: :unprocessable_entity }
      end
    end
    @question = Question.includes(:answers).find(params[:question_id])
    @response_question = ResponseQuestion.new
    @pagy, @answers = pagy(@question.answers, items: 8)
  end

  def show
    @question = Question.includes(:response_questions).find(params[:question_id])
  end

  def create
    question = Question.find(params[:question_id])
    if question.unique_choice?
      if validate_response_exist?
        return respond_to do |format|
          format.html { redirect_to question_url(params[:question_id]), alert: "You already answered this question" }
          format.json { render json: @response_question.errors, status: :unprocessable_entity }
        end
      end
    end

    @response_question = ResponseQuestion.new(question_params)
    @response_question.user_id = current_user.id
    respond_to do |format|
      if @response_question.save
        format.html { redirect_to question_url(@response_question.question_id), notice: "Response was successfully created." }
        format.json { render :show, status: :created, location: @response_question }
      else
        format.html { redirect_to question_url(@response_question.question_id), alert: "Please select one option" }
        format.json { render json: @response_question.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def question_params
    params.permit(:question_id, :answer_id)
  end

  def validate_response_exist?
    ResponseQuestion.where(user_id: current_user.id, question_id: params[:question_id]).exists?
  end
end
