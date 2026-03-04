class ProgramsController < ApplicationController
  def index
    @programs = Program.all
  end

  def show
    raise
    @program = Program.find(params[:id])
  end

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)
    @program.user = current_user

    if @program.save

      #appel à l'ia
      redirect_to @program, notice: "program was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def program_params
    params.require(:program).permit(:goal, :level, :medical_conditions, :number_of_week, :sport, :tools)
  end
end
