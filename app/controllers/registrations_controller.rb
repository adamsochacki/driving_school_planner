class User::RegistrationsController < Devise::RegistrationsController
  layout "devise", only: [:sign_in]
end