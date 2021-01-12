module SessionsHelper
  def log_in(user)
    remember(user)
    cookies.signed.permanent[:user_id] = user.id
    cookies.signed[:remember_digest] = user.remember_digest
  end

  def log_out
    forget(current_user)
    cookies.delete(:user_id)
    cookies.delete(:remember_digest)
  end

  def current_user
    @current_user = User.find_by(id: cookies.signed[:user_id]) if @current_user.nil?
    @current_user
  end

  def current_user?(user_id)
    current_user.id == user_id
  end

  def logged_in?
    !current_user.nil?
  end

  def forget(user)
    user.update(remember_digest: nil)
  end

  private

  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def new_token
    SecureRandom.urlsafe_base64
  end

  def remember(user)
    remember_digest = digest(new_token)
    user.update(remember_digest: remember_digest)
  end
end
