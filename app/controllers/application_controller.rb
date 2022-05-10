class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

    private

    def set_meta_tag
       set_meta title: "MySite"
    end
    
end
