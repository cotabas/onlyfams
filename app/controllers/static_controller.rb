class StaticController < ApplicationController
  skip_before_action :authenticate_user!, except: :timeline
  Event = Struct.new(:id, :user, :time, :content, :type, :post)

  def timeline
    @posts = Post.all
    @comments = Comment.all


    post_array = @posts.map { |post| Event.new(post.id, post.user_id, post.created_at, post.title, 'post') }
    comment_array = @comments.map { |comment| Event.new(comment.id, comment.user_id, comment.created_at, comment.body, 'comment', comment.post_id) }

    @events = post_array + comment_array
    @events = @events.sort_by { |event| event.time }.reverse

    
  end

end
