module TodoListHelpers
end

def visit_the(list)
  visit "/todo_lists"
  within dom_id_for(list) do
    click_link "View items"
  end
end

