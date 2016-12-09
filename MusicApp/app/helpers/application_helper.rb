module ApplicationHelper
  def ugly_lyrics(lyrics)
    html = "<pre>"
    lyrics.strip.split("\n").each do |line|
      html += "&#9835; " + "#{h(line)}" if line.length > 0
    end
    html += "</pre>"
    html.html_safe
  end
end
