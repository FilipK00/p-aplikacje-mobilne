module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
    end

    def current_user
        @current_user ||= Student.find_by(id: session[:student_id])
    end

    def logged_in?
        !current_student.nil?
    end
    
end
