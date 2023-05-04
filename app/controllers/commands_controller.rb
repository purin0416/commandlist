class CommandsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @pagy,@commands = pagy(current_user.commands.order(:id), items: 10)
  end
  
  def show
  end

  def new
    @command = Command.new
  end

  def create
    @command = current_user.commands.build(command_params)
    
    if @command.save
      flash[:success] = 'Command が正常に追加されました'
      redirect_to @command
    else
      flash.now[:danger] = 'Command が追加されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @command.update(command_params)
      flash[:success] = 'Command は正常に更新されました'
      redirect_to @command
    else
      flash.now[:danger] = 'Command は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @command.destroy

    flash[:success] = 'Command は正常に削除されました'
    redirect_to commands_url
  end
  
  private
  
  def command_params
    params.require(:command).permit(:content, :name, :language)
  end
  
  def correct_user
    @command = current_user.commands.find_by(id: params[:id])
    unless @command
      redirect_to root_url
    end
  end  
end
