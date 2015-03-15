module Users
  class RegistrationsController < Devise::RegistrationsController
    before_filter :configure_permitted_parameters

    # GET /users/sign_up
    # def new
    #   build_resource({})
    #   resource.build_user_details
    #   respond_with self.resource
    # end

    protected

    # def configure_permitted_parameters
    #   devise_parameter_sanitizer.for(:sign_up) { |u|
    #     u.permit(:email, :password, :password_confirmation, :profile_attributes => :fullname)
    #   }
    # end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u|
        u.permit(
            :email,
            :password,
            :password_confirmation,
            profile_attributes: [
                :id,
                :first_name,
                :last_name,
                :is_female,
                :phone,
                :academic_institute,
                :academic_degree,
                :academic_year,
                :shirt_size,
                :food_diet,
                :need_lab_comp,
                :experience
            ]
        )
      }
    end
  end

end
