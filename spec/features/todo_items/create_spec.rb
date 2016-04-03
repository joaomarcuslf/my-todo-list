require "rails_helper"

describe "Creating todo items" do
  let!(:todo_list) {
		TodoList.create(title: "My list", description: "My todo list")
	}

  it "is successful with valid content" do
    visit_the todo_list

    click_link "New Todo item"
    fill_in "Content", with: "Ruby"
    click_button "Save"

    expect(page).to have_content("Added todo list item.")
    within("ul.todo_items") do
		    expect(page).to have_content("Ruby")
		end
  end

  it "displays an error with no content" do
    visit_the todo_list

    click_link "New Todo item"
    fill_in "Content", with: ""
    click_button "Save"

    within("div.flash") do
      expect(page).to have_content("Something went wrong")
    end
    expect(page).to have_content("Content can't be blank")
  end
end
