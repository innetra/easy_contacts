module WebSitesHelper
  def place_web_site_form(owner)
    render :partial => "web_sites/web_sites", :locals => { :owner => owner }
  end
end
