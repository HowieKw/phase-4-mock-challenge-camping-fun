class SignupController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    # def create
    #     @signup = Signup.new(signup_params)
    #     if @signup.valid?
    #         @signup.save
    #         render json: @signup.activity.to_json(except: [:created_at, :updated_at]), status: :created
    #     else
    #         render json: {
    #             "errors": ["validation errors"]
    #         }, status: :unprocessable_entity
    #     end
    # end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end
