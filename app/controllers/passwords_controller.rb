class PasswordsController < ApplicationController
  before_action :authenticate_user, {only:[:edit, :update]}
  before_action :ensure_correct_user, {only:[:edit, :update]}

  def edit
    @user = User.find_by(id: params[:id])
  end
  def update
    @user = User.find_by(id: params[:id])
    if @user.authenticate(params[:old_password])
      if params[:new_password] == params[:confirmation_password]
        @user.password = params[:new_password]
        @user.save
        flash[:notice] ="パスワードを保存しました"
        redirect_to user_url(@user)
      else
        @error_message ="新しいパスワード(確認用)が一致しません"
        render edit_user_password_path(@user)
      end
    else
      @error_message ="パスワードが違います"
      render edit_user_password_path(@user)
    end
  end
end
