class AnimalsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    def index
        animals = Animal.all 
        render json: animals 
    end

    def show
        animal = Animal.find(params[:id])
        render json: animal 
    end

    def create
        animal = Animal.create(animal_params)
        render json: animal, status: :created
    end

    private
    def animal_params
        params.require(:animal).permit(:name, :description, :image)
    end
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
