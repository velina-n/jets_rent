class ApplicationController < ActionController::Base
  before_action :login_as_default_user, if: -> { Rails.env.development? }

  private

  def login_as_default_user
    # Cherche ou crée un utilisateur par défaut
    default_user = User.find_or_create_by!(email: 'default@example.com') do |user|
      user.password = 'password123'
    end

    # Connecte l'utilisateur par défaut en définissant `current_user`
    sign_in(default_user)
  end
end
