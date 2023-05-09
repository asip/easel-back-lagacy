# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController
  include Search::Query
  include Ref::User

  skip_before_action :require_login
  before_action :set_user, only: %i[show new create edit update]
  before_action :back_to_form, only: %i[create update]

  def show; end

  def new; end

  def edit; end

  def create
    @user.image_derivatives! if @user.image.present?
    if @user.save(context: :with_validation)
      redirect_to login_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user.attributes = user_params
    @user.image_derivatives! if @user.image.present?
    if @user.save(context: :with_validation)
      # puts @user.saved_change_to_email?
      if @user.saved_change_to_email?
        @user.assign_token(user_class.issue_token(id: @user.id, email: @user.email))
        cookies.permanent[:access_token] = @user.token
      end
      redirect_to profile_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = case action_name
            when 'show'
              User.find_by!(id: params[:id])
            when 'new'
              User.new
            when 'create'
              User.new(user_params)
            else
              current_user
            end
  end

  def back_to_form
    return unless params[:commit] == '戻る'

    @user.confirming = ''
    @user.attributes = user_params
    @user.image_derivatives! if @user.image.present?
    case action_name
    when 'create'
      render :new
    when 'update'
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :image,
      :confirming
    )
  end

  def query_params
    {}
  end

  def ref_params
    { ref: params[:ref], ref_id: params[:ref_id] }
  end
end
