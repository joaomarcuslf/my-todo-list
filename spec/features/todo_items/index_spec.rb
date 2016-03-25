require "rails_helper"

describe "Viewing todo items" do
	let!(:todo_list) {
		TodoList.create(title: "My list", description: "My todo list")
	}

	it "displays no items when todo lists is empty" do
		visit  "/todo_lists"

		within "#todo_list_#{todo_list.id}" do
			click_link "View items"
		end

		expect(page).to have_content("TodoItems#index")

	end
end
