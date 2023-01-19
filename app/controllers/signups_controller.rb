class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    def create 
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private

    def render_unprocessable_entity(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end 

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

end
