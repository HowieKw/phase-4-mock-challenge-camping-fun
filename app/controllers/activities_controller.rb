class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activity = find_activity
        activity.destroy
        
    end
    
    # def destroy
    #     @activity = Activity.find_by(id: params[:id])
    #     if @activity
    #         @activity.destroy
    #         render json: {}
    #     else
    #         render json: {
    #             "error": "Activity not found"
    #         }, status: :not_found
    #     end
    # end

    private

    def find_activity
        Activity.find(params[:id])
    end

    def render_not_found
        render json: { error: "Activity not found" }, status: :not_found
    end

end
