module ApplicationHelper
  def nav_link_to(name, url, **url_options, &)
    link_to(name, url, {class: "nav-link link-dark"}.merge(url_options), &)
  end
end
