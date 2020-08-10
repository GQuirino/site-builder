class GenerateHtml
  def self.perform(site)
    ActionController::Base
      .new
      .render_to_string(
        partial: 'api/v1/sites/site_template',
        layout: false,
        locals: { site: site })
  end
end
