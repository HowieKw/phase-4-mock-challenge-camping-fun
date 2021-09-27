class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = find_camper
        render json: camper, serializer: CamperWithActivitiesSerializer
    end

    # def show
    #     @camper = Camper.find_by(id: params[:id])
    #     if @camper
    #         render json: @camper.profile
    #     else
    #         render json: {
    #             "error": "Camper not found"
    #         }, status: :not_found
    #     end
    # end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    # def create
    #     @camper = Camper.new(camper_params)
    #     if @camper.valid?
    #         @camper.save
    #         render json: @camper.to_json(except: [:created_at, :updated_at]), status: :created
    #     else
    #         render json: {
    #             "errors": ["validation errors"]
    #         }, status: :unprocessable_entity
    #     end
    # end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def find_camper
        Camper.find(params[:id])
    end

    def render_not_found
        render json: { error: "Camper not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end
end
