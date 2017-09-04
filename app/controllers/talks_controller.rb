class TalksController < ApplicationController
  before_action :set_talk, only:[:edit, :update, :destroy]
  
  def index
    @talks = Talk.all
  end
  
  def new
    if params[:back]
      @talk = Talk.new(talks_params)
    else
      @talk = Talk.new
    end
  end
  
  def create
    # Talk.create(params[:talk])
    #Talk.create(talks_params)
    @talk = Talk.new(talks_params)
    if @talk.save
      redirect_to talks_path, notice: "ツイートしました"
    else
      render 'new'
    end
    #redirect_to talks_path, notice: "ツイートしました！"
  end
  
  def edit
    #@talk = Talk.find(params[:id])
  end
  
  def update
    #@talk = Talk.find(params[:id])
    #@talk.update(talks_params)
    if @talk.update(talks_params)
      redirect_to talks_path, notice: "ツイートを編集しました！"
    else
      render 'edit'
    end
    #redirect_to talks_path, notice: "ツイートを編集しました！"
  end
  
  def destroy
    #@talk = Talk.find(params[:id])
    @talk.destroy
    redirect_to talks_path, notice: "ツイートを削除しました！"
  end
  
  def confirm
    @talk = Talk.new(talks_params)
    render :new if @talk.invalid?
  end
  
  private
    def talks_params
      params.require(:talk).permit(:content)
    end
    
    def set_talk
      @talk = Talk.find(params[:id])
    end
end
