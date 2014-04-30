class PostObserver < ActiveRecord::Observer
  
  def after_save(post)
    @add_post_to_stream = Stream.new(:action => "new post", 
                                     :post_id => "#{post.id}",
                                     :name => "new post",
                                     :streamer_id => 1,
                                     :streamer_type => "Post")
    @add_post_to_stream.save
#   @this = @add_post_to_stream.id
#   post.update_attributes(:stream_id => "22")
  end
  
end