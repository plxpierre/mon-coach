class ProgramsController < ApplicationController
SYSTEM_PROMPT = "You are a professional personal fitness coach.

Your mission is to generate a workout program adapted to the user's level.

Duration = number of weeks
Analyze the equipment provided and use ONLY that equipment.
If no relevant equipment is provided, generate a bodyweight-only program.
Never invent additional equipment.

IMPORTANT:

STRICTLY follow the structure below.

Each week must contain exactly the number of sessions adapted to the goal.

Each session must be a string in Markdown format with:

A title formatted as: '### Day: Session Name'

A Structure: section

A Goal: section

Adapt intensity, progression, and exercises to the provided level and constraints.

Must be a valid JSON
week_program must be an array
Expected structure:
Start your response with: {

{
'title': 'Program Title',
'weeks': [
{
'week_number': 1,
'week_program': [
'### Monday: Session Name\n\nDescription...\n\n**Structure:**\n- ...\n\n**Goal:** ...',
'### Wednesday: Session Name\n\nDescription...\n\n**Structure:**\n- ...\n\n**Goal:** ...',
'### Friday: Session Name\n\nDescription...\n\n**Structure:**\n- ...\n\n**Goal:** ...'
]
},
{
'week_number': 2,
'week_program': [
'### Monday: Session Name\n\nDescription...\n\n**Structure:**\n- ...\n\n**Goal:** ...',
'### Wednesday: Session Name\n\nDescription...\n\n**Structure:**\n- ...\n\n**Goal:** ...',
'### Friday: Session Name\n\nDescription...\n\n**Structure:**\n- ...\n\n**Goal:** ...'
]
}
]
}
"

  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
  end

  def new
    @program = Program.new
  end

  def create
    ruby_llm_chat = RubyLLM.chat
    response = ruby_llm_chat.with_instructions(SYSTEM_PROMPT).ask(program_params.to_s)
    response = JSON.parse(response.content)
    @program = Program.new({ title: response["title"], user: current_user }.merge(program_params))
    if @program.save
      response["weeks"].each do |week|
        @program.weeks.create(week)
      end
      redirect_to @program, notice: "program was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    # On redirige vers l'index avec un message de succès
    redirect_to programs_path, notice: "Programme supprimé.", status: :see_other
  end
  private



  def program_params
    params.require(:program).permit(:goal, :level, :medical_conditions, :number_of_week, :sport, :tools)
  end
end
