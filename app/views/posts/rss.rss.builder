#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Newstler"
    xml.description "Education and scince news."
    xml.link root_path
    xml.language "en"

    for article in @post
      xml.item do
        xml.title article.title
        xml.pubDate article.created_at.to_s(:rfc822)
        xml.link 'http://localhost:3000/posts/' + article.id.to_s
        truncated_string = article.text.split[0...10].join(' ')
        xml.description truncated_string + '...'
      end
    end
  end
end