---
layout: false
---

xml.instruct!
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.select{ |p| p.ext == '.html' }.sort_by{ |p| p.url }.each do |page|
    xml.url do
      xml.loc "http://mac-dev-env.patrickbougie.com#{page.url}"
      xml.lastmod Time.new.utc.iso8601
      xml.changefreq page.data.changefreq || "daily"
      xml.priority page.data.priority || "0.8"
    end
  end
end
