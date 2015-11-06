xml.instruct!
xml.posts do
  @posts.each do |post|
    xml.post do
      short_text = post.text.split[0...10].join(' ') + '...'

      link = 'http://localhost:3000/posts'+ post_path(post) + '.xml'
      xml.link link
      xml.title post.title
      xml.body short_text
      xml.published_at post.created_at.to_s(:rfc822)
    end
  end
end