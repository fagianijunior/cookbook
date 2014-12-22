class PostsController < ApplicationController
  before_action :logged_in_user,  only:    [:create, :destroy]
  before_action :correct_user,    only:    [:edit, :update]

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)
    respond_to do |format|
      if @post.save
        format.js
      else
        #format.html { render :new }
        format.js
      end
    end
  end

  def delete_post
    
    @post.update_column(:email_confirmed, true)
  end
  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:content, :type_post_id)
    end
end
