class CommentObserver < ActiveRecord::Observer
  
  def after_save(comment)
    @add_comment_to_stream = Stream.new(:action => "new comment", 
                                        :comment_id => "#{comment.id}",
                                        :name => "new comment",
                                        :streamer_id => 1,
                                        :streamer_type => "Comment")
    @add_comment_to_stream.save
  end

end
