require("capybara/rspec")
require("./app")
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("create a stage path", { :type => :feature }) do
  it("creates an stage and then goes to the stage page") do
    visit("/")
    click_button('stage-add')
    visit("/stage_add")
    fill_in("name", :with => "Yellow Submarine")
    click_button("go")
    expect(page).to have_content("Yellow Submarine")
  end
end
