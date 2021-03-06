class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    respond_to :html


    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def edit
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(post_params)        
        flash[:notice] = 'Post was successfully created.' if @post.save
        respond_with @post, :location => root_path       
    end

    def update
        @post = Post.find(params[:id])
        if current_user.id == @post.user_id
            flash[:notice] = 'Post was successfully updated.' if @post.update(post_params)
            respond_with @post, :location => root_path    
        else
            flash[:alert] = 'You don\'t have permission to update this post'
            respond_with @post    
        end         
    end

    def destroy
        @post = Post.find(params[:id])
        if current_user.id == @post.user_id
            flash[:notice] = 'Post was successfully deleted.' if @post.destroy
            respond_with @post, :location => root_path
        else
            flash[:alert] = 'You don\'t have permission to delete this post'
            respond_with @post    
        end 
    end

    
    private

    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end


end
