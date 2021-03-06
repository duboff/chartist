class ChartsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]

  def new
    @chart = Chart.new
    render layout: "nofooter"
  end

  def create
    @chart = Chart.new params[:chart].permit(:name, :chart_type, :csv, :dashboard_titles, :colorscheme, :description, :table_data)
    @chart.user = current_user
    if @chart.save
      redirect_to chart_path(@chart)
    else
      flash[:error] = @chart.errors.full_messages.join(', ')
      render "new"
    end
  end

  def show
    @chart = Chart.find params[:id]
    @url = chart_url(@chart)
    @title = @chart.name
    respond_to do |format|
      format.json {render json: @chart.generate_json }
      format.html
      format.csv { send_data @chart.to_csv}
    end
  end

  def index
    @charts = Chart.search(params[:search])
  end

  def destroy
    @chart = Chart.find params[:id]
    @chart.destroy
    redirect_to '/charts'
  end

  def edit
    @chart = Chart.find params[:id]
  end

  def update
    @chart = Chart.find params[:id]
    @chart.csv = nil
    @chart.update! params[:chart].permit(:name, :description, :chart_type, :dashboard_titles)
    redirect_to chart_path(@chart)
  end
end
