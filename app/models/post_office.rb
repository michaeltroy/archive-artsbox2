class PostOffice < ActionMailer::Base
  
  # Post Office queues mail in a db table.
  self.delivery_method = :activerecord
  
  def newsletter_mailout(user, newsletter)
    recipients   user.email
    sent_on      Time.now
    from         "hello@artsbox.com"
    subject      newsletter.subject    
    body         :body => newsletter.body, :user => user
  end
  
end