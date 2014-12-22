class RegistrationsController < Devise::RegistrationsController

# GET /resource/sign_up
  def new


    build_resource({})
    self.resource.address = Address.new
   # set_minimum_password_length
    yield resource if block_given?
    respond_with self.resource
  end




  private

  def sign_up_params

    params.require(:user).permit(:email, :first_name,:last_name, :password, :password_confirmation, address_attributes: [:city, :postal_code, :street, :house_number, :country])
  end



  def account_update_params
    params.require(:user).permit(:email, :first_name,:last_name, :password, :password_confirmation,:current_password, address_attributes: [:city, :postal_code, :street, :house_number, :country])
  end
end