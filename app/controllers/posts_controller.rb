class PostsController < ApplicationController
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
        flash[:notice] = 'Post was successfully updated.' if @post.update(post_params)
        respond_with @post, :location => root_path 
    end

    def destroy
        @post = Post.find(params[:id])
        flash[:notice] = 'Post was successfully deleted.' if @post.destroy
        respond_with @post, :location => root_path 
    end

    
    private

    def post_params
        params.require(:post).permit(:title, :content)
    end


end
