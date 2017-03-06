class QuestionsController < ApplicationController
	
	def index 
		@questions = Question.all.order("created_at DESC")
	end

	
	def show
		@question = Question.find(params[:id])
		@comment = Comment.new
		@comments = @question.comments
	end

	def new 
		@question = Question.new
		@comment = Comment.new
	end

	def create
		@question = Question.new(question_params)
		if @question.save
			flash[:notice] = "Question created!"
			redirect_to questions_path
		else
			flash[:alert] = "Wing order not created"
			render :new
		end
	end

	def edit 
		@question = Question.find(params[:id])
	end

	def update 
		@question = Question.find(params[:id])
		if @question.update(question_params)
			redirect_to @question
		else
			render action: 'edit'
		end
	end

	def destroy
		@question = Question.find(params[:id])
		@question.destroy

		redirect_to questions_path
  end


	private 
	 def question_params
      params.require(:question).permit(:title, :description)
    end
end
