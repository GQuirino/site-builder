namespace :site do
  task generate_pages: :environment do
    sites = Site.where(code_rendered: false)

    sites.each do |site|
      html = GenerateHtml.perform(site)
      PageCode.create(site: site, html: html)
      site.update(code_rendered: true)
    end
  end
end
