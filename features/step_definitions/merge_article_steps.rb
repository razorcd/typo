When(/^the following articles exist$/) do |table|
    table.hashes.each do |hash|
        hash["id"] = hash["id"].to_i
        a = Article.new(hash)
        a.id = hash[:id]
        a.save
    end
end



When(/^I am on the ([^"]*) for "([^"]*)"$/) do |page_name, article_name|
    id = Article.find_by_title(article_name).id.to_s
    visit(path_to(page_name) + id)
end

Then(/^the article "([^"]*)" should have ([^"]*) "([^"]*)"$/) do |title, field, content|
    a = Article.where(title: title).first
    a[field].should eq content
end