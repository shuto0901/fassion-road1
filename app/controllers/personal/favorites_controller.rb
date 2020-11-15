class Personal::FavoritesController < ApplicationController
    
 def create
    post = Post.find(params[:post_id])
    favorite = current_company.favorites.new(post_id: post.id)
    favorite.save
    redirect_to personal_post_path(post)
 end

def destroy
    post = Post.find(params[:post_id])
    favorite = current_company.favorites.find_by(post_id: post.id)
    favorite.destroy
    redirect_to personal_post_path(post)
end
end
