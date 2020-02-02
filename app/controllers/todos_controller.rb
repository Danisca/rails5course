class TodosController < ApplicationController
	
	

	def index
		@todos = Todo.all
	end

	def new
		@todo = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			flash[:notice] = "the todo was created succefully"
			redirect_to todo_path(@todo)
		else
			#flash[:error] = "There are some errors"
			render 'new'
		end
	end

	def show
		@todo = Todo.find(params[:id])
	end

	def edit
		@todo = Todo.find(params[:id])	
	end

	def destroy
		todo = Todo.find(params[:id])	
		if todo.destroy
			flash[:notice] = "the todo was deleted succefully"
		else
			flash[:notice] = "the todo was not Deleted"
		end
		redirect_to todos_path
	end

	def update
		@todo = Todo.find(params[:id])
		if @todo.update(todo_params)
			flash[:notice] = "the todo was updated succefully"
			redirect_to todo_path(@todo)
		else
			#flash[:error] = "There are some errors"
			render 'edit'
		end
	end

	private 

	def todo_params
		params.require(:todo).permit(:name,:description)
	end



end