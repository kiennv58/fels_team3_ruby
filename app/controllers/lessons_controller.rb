class LessonsController < ApplicationController
	before_action :logged_in_user,  only: [:create]
	def index
		@lessons = Lesson.all
		respond_to do |format|
			format.html
			format.json { render json: @lessons }
		end
	end

	def create
		@lesson = Lesson.new lesson_params
		respond_to do |format|

			if @lesson.save
				format.html do
					flash[:success] = "Created!"
					redirect_to @lesson
				end
				format.json {render json: {lesson: @lesson.as_json }, status: :ok }

			else
				format.html {flash[:success] = "!!!"}
				format.json {render json: {message: "fail"}, status: :fail}
			end
		end
	end

	def show
		@lesson = Lesson.find params[:id]
	end

	private
	def lesson_params
	  params.require(:lesson).permit :category_id, :user_id
	end

	def logged_in_user
      unless  logged_in?
        flash[:danger]  = "Please log in."
        redirect_to login_url
      end
  end
end