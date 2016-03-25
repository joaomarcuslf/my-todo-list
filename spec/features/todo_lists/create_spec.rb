require 'spec_helper'

describe "Creating todo lists" do
	it "redirects to the todo list index page on success" do
		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")

		fill_in "Title", with: "My List"
		fill_in "Description", with: "My test list"
		click_button "Create Todo list"

		expect(page).to have_content("My List")
	end

	it "displays an error when the todo list has no title" do
		expect(TodoList.count).to be_zero

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")

		fill_in "Title", with: ""
		fill_in "Description", with: "My test list"
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to be_zero

		visit "/todo_lists"
		expect(page).to_not have_content("My test list")		
	end


	it "displays an error when the todo list has no description" do
		expect(TodoList.count).to be_zero

		visit "/todo_lists"
		click_link "New Todo list"
		expect(page).to have_content("New Todo List")

		fill_in "Title", with: "Blah"
		fill_in "Description", with: ""
		click_button "Create Todo list"

		expect(page).to have_content("error")
		expect(TodoList.count).to be_zero

		visit "/todo_lists"
		expect(page).to_not have_content("My test list")		
	end
end