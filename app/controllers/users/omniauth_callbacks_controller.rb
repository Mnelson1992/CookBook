class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
<<<<<<< HEAD

  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
=======
>>>>>>> parent of 4432729... updated the spec file
end
