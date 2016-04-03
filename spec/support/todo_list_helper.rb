module TodoListHelpers
end

def visit_the(list)
  visit "/todo_lists"
  within "#todo_list_#{list.id}" do
    click_link "View items"
  end
end

