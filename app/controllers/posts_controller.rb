class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  layout 'poster', only: [:show]
  include ApplicationHelper

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

  end

  # GET /posts/new
  def new
    @post = Post.new
    @permissions = current_user_post_permission(current_user)
  end

  # GET /posts/1/edit
  def edit
    @permissions = current_user_post_permission(current_user)
  end

  # POST /posts
  # POST /posts.json
  def create
    # fail set_post_object.inspect
    @post = Post.new(set_post_object)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(set_post_object)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_object
      object = {
        title: post_params[:title],
        post_type_id: post_params[:post_type_id],
        body: post_params[:body],
        action_url: post_params[:action_url],
        video_url: post_params[:video_url],
        author_id: post_params[:author_id],
        summary: post_params[:summary],
        department_id: post_params[:department_id],
        expiration_date: post_params[:expiration_date],
        tag_names: post_params[:tag_names].split(',') || '' }
    end

    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :department_id, :author_id, :post_type_id, :tag_names, :video_url, :action_url, :summary, :expiration_date)
    end
end
