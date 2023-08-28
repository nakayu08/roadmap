class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @task = Task.find(params[:task_id]) #追加
    if @comment.save
      CommentChannel.broadcast_to @task, { comment: @comment, user: @comment.user } #追加
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, task_id: params[:task_id])
  end
end
