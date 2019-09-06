class LikesController < ApplicationController
  def create
    @like = current_user.likes.build(like_params)
    @post = @like.post
    if @like.save
      respond_to :js
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @post = @like.post
    if @like.destroy
      respond_to :js
    end
  end

  # 受け取ったHTTPリクエストからidを判別し、指定のレコード1つを@likeに代入
  # リアルタイムでビューを反映させるためにフォーマットをJS形式でレスポンスを返す

  private
    def like_params
      params.permit(:post_id)
    end
end