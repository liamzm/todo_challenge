require 'rspec'

require_relative '../../todo.rb'

class Task < ApplicationRecord
	validates_uniqueness_of :task

end