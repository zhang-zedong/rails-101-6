class PostsController < ApplicationController
  before_action :authenticate_user!
  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end
  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user
    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end
  def edit
    @post = Post.find(params[:id])
    @group = Group.find(params[:group_id])
    if current_user != @post.user
      redirect_to account_posts_path, warning: "You have no permission!"
    end
  end
  def update
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to account_posts_path, notice: "Update Success!"
    else
      render :edit
    end
  end
  private
  def post_params
    params.require(:post).permit(:content)
  end

end
