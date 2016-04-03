require "rails_helper"

describe "Editing todo items" do
  let!(:todo_list) {
		TodoList.create(title: "My list", description: "My todo list")
	}
  let!(:todo_item) { todo_list.todo_items.create( content: "Ruby") }

  it "updates a todo item successfully with valid content" do
    visit_the todo_list

    within "#todo_item_#{todo_item.id}" do
      click_link "Edit item"
    end

    fill_in "Content", with: "Teste"
    click_button "Save"

    expect(page).to have_content("Saved todo list item.")

    todo_item.reload

    expect(todo_item.content).to eq "Teste"
  end

  it "is unsuccesssful with no content" do
    visit_the todo_list

    within "#todo_item_#{todo_item.id}" do
      click_link "Edit item"
    end

    fill_in "Content", with: ""
    click_button "Save"

    expect(page).to have_content("Something went wrong")

    todo_item.reload

    expect(todo_item.content).to eq "Ruby"
  end
end
