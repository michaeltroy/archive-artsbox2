module EventsHelper
  
  def image_for(event, size = :small)
    if event.image
      event_image = event.image.public_filename(size)
      link_to image_tag(event_image), event.image.public_filename
    else
      image_tag("black-event-image-#{size.png}")
    end
  end
  
end
