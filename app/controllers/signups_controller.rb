class SignupsController < ApplicationController
    def index
        signups = Signup.all
        render json: signups
      end

      def create
        signup = Signup.new(signup_params)
        if signup.save
          activity = signup.activity
          render json: {
            id: activity.id,
            name: activity.name,
            difficulty: activity.difficulty
          }, status: :created
        else
          render json: { errors: signup.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
      private
  def signup_params
    params.permit(:title, :camper_id, :activity_id) # Add the required parameters
  end
end
