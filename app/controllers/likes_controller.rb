class LikesController < ApplicationController
    def create
       @like = current_user.likes.create(material_id: params[:material_id])
      redirect_back(fallback_location: root_path)
    end
    
    def destroy
      @material = Material.find(params[:material_id])
      @like = current_user.likes.find_by(material_id: @material.id)
      @like.destroy
      redirect_back(fallback_location: root_path)
    end
end
