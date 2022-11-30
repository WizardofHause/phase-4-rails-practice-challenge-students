class InstructorsController < ApplicationController

    before_action :find_instructor, only: [:show, :update, :destroy]

    def index
        render json: Instructor.all, status: :ok
    end

    def show
        render json: @instructor, status: :ok
    end

    def create
        instructor = Instructor.create!(instructor_params)
        render json: instructor, status: :created
    end

    def update
        @instructor.update!(instructor_params)
        render json: @instructor, status: :accepted
    end

    def destroy
        @instructor.destroy
        head :no_content
    end

    private

    def instructor_params
        params.permit(:name)
    end

    def find_instructor
        @instructor = Instructor.find(params[:id])
    end
end
