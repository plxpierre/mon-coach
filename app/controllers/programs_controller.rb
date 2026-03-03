class ProgramsController < ApplicationController
  before_action :authenticate_user!

  def index
    @programs = current_user.programs
  end

  def new
    @program = Program.new
  end

  def create
    raise
  end
end
