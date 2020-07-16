class MaterialsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @materials = Material.all
  end

  def show
    @material = Material.find(params[:id])
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    @material.user_id = current_user.id
    if @material.save
      redirect_to material_path(@material), notice: "投稿に成功しました"
    else
      render :new
    end
  end


  def edit
    @material = Material.find(params[:id])
    if @material.user != current_user
      redirect_to materials_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @material = Material.find(params[:id])
    if @material.update(material_params)
      redirect_to material_path(@material), notice: "レシピを更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @material = Material.find_by(params[:id])
    @material.destroy
    redirect_to material_path
  end

  private
  def material_params
    params.require(:material).permit(:title, :body, :image, :video)
  end
end
