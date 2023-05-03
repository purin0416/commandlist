class CommandsController < ApplicationController
  before_action :set_command, only: [:show, :edit, :update, :destroy]
  
  def index
    @pagy,@commands = pagy(Command.all, items: 10)
  end
  
  def show
  end

  def new
    @command = Command.new
  end

  def create
    @command = Command.new(command_params)
    
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
  
  def set_command
    @command = Command.find(params[:id])
  end
  
  def command_params
    params.require(:command).permit(:content, :name, :language)
  end
end
