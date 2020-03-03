class HabitsController < ApplicationController
  def index
    @habits = Habit.all.order({ :created_at => :desc })

    render({ :template => "habits/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @habit = Habit.where({:id => the_id }).at(0)

    render({ :template => "habits/show.html.erb" })
  end

  def create
    @habit = Habit.new
    @habit.name = params.fetch("query_name")
    @habit.time_of_day = params.fetch("query_time_of_day")
    @habit.first_day = params.fetch("query_first_day")
    @habit.checkin_count = params.fetch("query_checkin_count")
    @habit.checkin_today = params.fetch("query_checkin_today", false)
    @habit.owner_id = params.fetch("query_owner_id")

    if @habit.valid?
      @habit.save
      redirect_to("/habits", { :notice => "Habit created successfully." })
    else
      redirect_to("/habits", { :notice => "Habit failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @habit = Habit.where({ :id => the_id }).at(0)

    @habit.name = params.fetch("query_name")
    @habit.time_of_day = params.fetch("query_time_of_day")
    @habit.first_day = params.fetch("query_first_day")
    @habit.checkin_count = params.fetch("query_checkin_count")
    @habit.checkin_today = params.fetch("query_checkin_today", false)
    @habit.owner_id = params.fetch("query_owner_id")

    if @habit.valid?
      @habit.save
      redirect_to("/habits/#{@habit.id}", { :notice => "Habit updated successfully."} )
    else
      redirect_to("/habits/#{@habit.id}", { :alert => "Habit failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @habit = Habit.where({ :id => the_id }).at(0)

    @habit.destroy

    redirect_to("/habits", { :notice => "Habit deleted successfully."} )
  end
end
