class WorkoutsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,   only: :destroy

	def create
		@workout = current_user.workouts.build(micropost_params)
    	if @workout.save
      	flash[:success] = "Workout created!"
      	redirect_to root_url
    	else
    		@feed_items = []
      		render 'static_pages/home'
    	end
	end

	def destroy
		@workout.destroy
    	flash[:success] = "Workout deleted"
    	redirect_to request.referrer || root_url
	end

	private

		def workout_params
			params.require(:workout).permit(:exercise1)
			params.require(:workout).permit(:exercise2)
			params.require(:workout).permit(:exercise3)
			params.require(:workout).permit(:exercise4)
			params.require(:workout).permit(:exercise5)
			params.require(:workout).permit(:exercise6)
			params.require(:workout).permit(:tag)
			params.require(:workout).permit(:day)
		end

		def correct_user
      		@workout = current_user.workouts.find_by(id: params[:id])
      		redirect_to root_url if @workout.nil?
    	end
end