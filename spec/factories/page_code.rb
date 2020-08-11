FactoryBot.define do
  factory :page_code do
    html { "<html><head></head><body>CONTENT</body></html>".html_safe }
    association :site
  end
end
