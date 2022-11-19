class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if params[:query].present?
      @events = Event.search_by_title_and_description(params[:query])
    else
      @mostrecentevent = Event.all.sort_by { |e| e[:start_date] }.first(3)
    end
  end
end
