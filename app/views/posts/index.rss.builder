# app/views/posts/index.rss.builder
xml.channel do
  # Required to pass W3C validation.
  xml.atom :link, nil, {
    :href => user_posts_url(:format => 'rss'),
    :rel => 'self', :type => 'application/rss+xml'
  }
  
  # Posts.
  @posts.each do |post|
    xml.item do
      xml.title         post.title
      xml.link          user_post_url(@user, post)
      xml.summary       "#{post.body}"
      xml.pubDate       post.created_at.to_s(:rfc822)
      xml.guid          user_post_url(@user, post)
      
      # Get the author.
      xml.author        "#{post.user.permalink}"
    end
  end
end