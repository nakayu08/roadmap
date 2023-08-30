class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @task = Task.find(params[:task_id]) #追加
    if @comment.save
      CommentChannel.broadcast_to @task, { comment: @comment, user: @comment.user } #追加
    else
      @error_comment = @comment
      render :error  
    end
  end

  def destroy
    @task = Task.find(params[:task_id])
    comment = @task.comments.find(params[:id])
    if current_user.id == comment.user.id
      comment.destroy
      redirect_to edit_task_path(params[:task_id])
    else
      redirect_to tasks_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, task_id: params[:task_id])
  end
end
