# app/controllers/programs_controller.rb
require "ostruct"

class ProgramsController < ApplicationController
  before_action :authenticate_user!

  def index
    @programs = current_user.programs

    # Temporary fallback: show demo cards until create is implemented
    if @programs.empty?
      @programs = [
        OpenStruct.new(id: 1, title: "Hybrid Strength"),
        OpenStruct.new(id: 2, title: "Endurance Builder"),
        OpenStruct.new(id: 3, title: "Bodyweight Elite")
      ]
    end
  end

  def new
    @program = Program.new
  end

  def create
  end
end
