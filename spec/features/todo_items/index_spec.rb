require "rails_helper"

describe "Viewing todo items" do
	let!(:todo_list) {
		TodoList.create(title: "My list", description: "My todo list")
	}

	def visit_the(list)
		visit "/todo_lists"
		within "#todo_list_#{list.id}" do
			click_link "View items"
		end
	end

	it "displays the title of the todo list" do
		visit_the todo_list
		within("h2") do
			expect(page).to have_content(todo_list.title)
		end
	end

	it "displays no items when todo lists is empty" do
		visit_the todo_list
		expect(page.all("ul.todo_items li").size).to be_zero
	end

	it "displays items content when a todo list has items" do
		todo_list.todo_items.create(content: "Estudar Ruby")
		todo_list.todo_items.create(content: "Estudar Java")

		visit_the todo_list

		expect(page.all("ul.todo_items li").size).to eq(2)

		within "ul.todo_items" do
			expect(page).to have_content("Estudar Ruby")
			expect(page).to have_content("Estudar Java")
		end
	end
end
