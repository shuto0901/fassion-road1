class FavoritesController < ApplicationController

 def create
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.new(company_id: current_company.id)
    favorite.save
 end

 def destroy
    @post = Post.find(params[:post_id])
    favorite = @post.favorites.find_by(company_id: current_company.id)
    favorite.destroy
 end

end