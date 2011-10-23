class AddAcceptSolutionToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :accept_solution, :boolean
  end
end
