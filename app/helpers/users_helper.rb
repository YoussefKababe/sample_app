module UsersHelper
  def gravatar_for user
    hash = Digest::MD5::hexdigest user.email
    image_tag("http://www.gravatar.com/avatar/#{hash}", alt: user.name, class: "gravatar")
  end
end
