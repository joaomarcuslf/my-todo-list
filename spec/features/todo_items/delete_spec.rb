require "rails_helper"

describe "Deleting todo items" do
  let!(:todo_list) { TodoList.create(title: "My list", description: "My todo list") }
  let!(:todo_item) { todo_list.todo_items.create(content: "Teste") }

  it "is successful" do
    visit_the todo_list
    within "#todo_item_#{todo_item.id}" do
      click_link "Delete"
    end
    expect(page).to have_content("Todo list item was deleted.")
    expect(TodoItem.count).to be_zero
  end
end
