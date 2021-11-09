class SignupsController < ApplicationController

def create
    signup = Signup.create(post_params)
    if signup.valid?
    render json: signup.activity, status: 201
    else 
    render json: {"error": signup.errors.full_messages}, status: :unprocessable_entity
    end

end




private 

def post_params
params.permit(:time, :camper_id, :activity_id)
end


end