class PlantsController < ApplicationController

    def index
        plants = Plant.all 
        render json: plants, only: [:id, :name, :image, :price]
    end

    def show
        # byebug
        plant = Plant.find(params[:id])
        render json: plant, only: [:id, :name, :image, :price]
    end

    def create
        new_plant = Plant.create(bird_params)
        render json: new_plant, status: :created
    end

    private

    def bird_params
        params.permit(:name, :image, :price)
    end
end
