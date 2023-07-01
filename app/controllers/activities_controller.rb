class ActivitiesController < ApplicationController
    def index
        activities = Activity.all
        render json: activities
      end

      def destroy
        activity = Activity.find(params[:id])
        activity.signups.destroy_all
        activity.destroy
        head :no_content
      end
end
