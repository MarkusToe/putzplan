class CleaningDatesController < ApplicationController
  def create
    @user = current_user
    current_cleaning_date = Date.today.end_of_week
    Activity.all.each do |activity|
      @user.cleaning_dates.create(activity: activity, date: current_cleaning_date)
      current_cleaning_date = current_cleaning_date + 14
    end
    redirect_to @user
  end
end
