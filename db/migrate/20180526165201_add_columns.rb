require_relative '../../config/application.rb'


class AddColumns < ActiveRecord::Migration[5.0]

	def change

		# create_table :tasks do |t|
		# 	t.string :description
		# 	t.string :status
		# end

		add_column :tasks, :task_number, :integer
	end
end

