class CommentsController < ApplicationController
	
	def create
		@question = Question.find(params[:question_id])

		@comment = Comment.new(comment_params)

		@comment.question = @question
		
		if @comment.save
			redirect_to question_path(@question)
			flash[:notice] = "Question created!"
		else
			flash[:alert] = "Question not created"
		end
	end
	

	
	private 

	def comment_params
		params.require(:comment).permit(:title, :body)
	end
end

