require_relative '../../config/application.rb'


class UpdateTable < ActiveRecord::Migration[5.0]

	def change

		create_table :tasks do |t|
			t.string :description
			t.string :status
		end
	end
end

