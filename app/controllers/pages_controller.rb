class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :test ]
  # before_action :check_signed_in

  def check_signed_in
    redirect_to questionnaires_path if signed_in?
  end

  def home
  end

  def test
    @questionnaire = Questionnaire.find(15)
    @questions = []
    @options = []
    @respostas = 0
    @questionnaire.questions.each do |q|
      @questions << q.name
    end
    @questionnaire.questions.each do |q|
      q.answers.each do |a|
        @options << a.name
      end
    end
      @questionnaire.questions.each do |q|
        q.answers.each do |a|
          if a.correct == true
            @resposta = a.name
          end
          @resposta
       end
    end
    @primeira_opção = @options[0]
    @segunda_opção = @options[1]
    @terceira_opção = @options[2]
  end

end
