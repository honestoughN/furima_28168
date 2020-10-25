class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    item = Item.find(params[:item_id])
    user_name = current_user.nickname
    unless @comment.text.blank?
      if @comment.save
        ActionCable.server.broadcast 'comment_channel', content: @comment, item: item, user_name: user_name
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
