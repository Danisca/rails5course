class TodosController < ApplicationController
	
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
		
	end
	def edit
		
	end

	private 

	def todo_params
		params.require(:todo).permit(:name,:description)
	end

	

end