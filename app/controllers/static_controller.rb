class StaticController < ApplicationController
    before_action :require_token, only: [:feed]
    def index
        @students_number = 5
        @stations = PetrolStation.all
    end
end