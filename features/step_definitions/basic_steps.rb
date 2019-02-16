Given("I visit the landing page") do 
    visit root_path
end

Given("The following users exist") do |table|
    table.hashes.each do |user|
        FactoryBot.create(:user, user)
    end
end

When("I click on {string}") do |button_name|
    click_on button_name
end


When("I fill in {string} with {string}") do |field, input|
  fill_in field, with: input
end

Given("I am logged in as {string}") do |name|
    user = User.find_by(name: name)
    login_as user, scope: :user
end

Given("I am on the {string} page") do |page_path|
    case page_path 
    when 'sign up'
        visit new_user_registration_path
    when 'inbox'
        visit mailbox_inbox_path
    else
        return false
    end
end