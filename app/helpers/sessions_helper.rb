module SessionsHelper

  def sign_in(user, permanent)
    remember_token = User.new_remember_token
    if permanent 
      cookies.permanent[:remember_token] = remember_token
    else
      cookies[:remember_token] = remember_token
    end
    user.update_attribute(:remember_token, User.hash(remember_token))
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.hash(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end

  def current_user?(user)
    @current_user == user
  end

  def sign_out
    current_user.update_attribute(:remember_token,
                                  User.hash(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  #Before filters
  def signed_in_user
    redirect_to signin_path, notice: "Please sign in." unless signed_in?
  end

  def correct_user(user_id)
    begin
      user = User.find(user_id)
      redirect_to root_url, notice: "Wrong user." unless current_user?(user)
    rescue ActiveRecord::RecordNotFound
      redirect_to root_url, notice: "You are trying to access an incorrect user."
    end
  end
  
end
