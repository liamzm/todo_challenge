require_relative '../../config/application.rb'


class CreateTable < ActiveRecord::Migration[5.0]

	def change

		create_table :table do |t|
			t.string :description
			t.string :status
		end
	end
end

