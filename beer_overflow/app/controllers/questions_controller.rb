class QuestionsController < ApplicationController

before_action :set_question, only: [:show, :edit, :destroy, :update]

  def show
  end

  def edit
  end

  def update
    @question.update(question_params)
    redirect_to @question
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :asker_id, :best_answer_id)
  end
end