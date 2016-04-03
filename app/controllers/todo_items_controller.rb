class TodoItemsController < ApplicationController
  before_action :find_todo_list

  def index
  end

  def new
    @todo_item = @todo_list.todo_items.new
  end

  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)
    if @todo_list.save
      flash[:success] = "Added todo list item."
      redirect_to todo_list_todo_items_path
    else
      flash[:error] = "Something went wrong"
      render action: :new
    end
  end

  def edit
    @todo_item = @todo_list.todo_items.find(params[:id])
  end

  def update
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.update_attributes(todo_item_params)
      flash[:success] = "Saved todo list item."
      redirect_to todo_list_todo_items_path
    else
      flash[:error] = "Something went wrong"
      render action: :edit
    end
  end

  def destroy
    @todo_item = @todo_list.todo_items.find(params[:id])
    if @todo_item.destroy
      flash[:succes] = "Todo list item was deleted."
    else
      flash[:error] = "Something went wrong"
    end

    redirect_to todo_list_todo_items_path
  end

  def url_options
        { todo_list_id: params[:todo_list_id] }.merge(super)
  end


  private

    def find_todo_list
      @todo_list = TodoList.find{ params[:todo_list_id] }
    end

    def todo_item_params
      params.require(:todo_item).permit(:content)
    end
end
