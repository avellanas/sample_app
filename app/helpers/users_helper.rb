module UsersHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_d = ["identicon", "monsterid", "wavatar", "retro"].shuffle[0]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=#{gravatar_d}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end
end