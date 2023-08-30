class CommentChannel < ApplicationCable::Channel
  def subscribed
    @task = Task.find(params[:task_id]) # 追記
    stream_for @task # 追記
    
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
