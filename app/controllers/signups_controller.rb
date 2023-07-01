class SignupsController < ApplicationController
    def index
        signups = Signup.all
        render json: signups
      end

      def create
        signup = Signup.new(signup_params)
        if signup.save
            render json: signup, status: :created
          else
            render json: { error: "Failed to create signup" }, status: :unprocessable_entity
          end
      end

      private
  def signup_params
    params.permit(:param1, :param2) # Add the required parameters
  end
end
