class StaticController < ApplicationController

    def index
        @students_number = 5
        @stations = PetrolStation.all
    end

    def feed
    end

end
