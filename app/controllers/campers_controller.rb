class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
        render json: camper, serializer: CamperActivitiesSerializer, status: 200
        else
        render json: {error: "Camper not found"}, status: :not_found
        end
    end

    def create
        newcamper = Camper.create(post_params)
        if newcamper.valid?
        render json: newcamper, status: 201
        else 
        render json: {"errors": newcamper.errors.full_messages}, status: :unprocessable_entity
        end

    end




private 

def post_params
    params.permit(:name, :age)
  end


end
