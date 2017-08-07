class JobsearchesController < ApplicationController

  def index
    @articles=Article.all.paginate(page:params[:page],per_page:30)
  end

  def action
    base_url='https://sfbay.craigslist.org/search/jjj?query='
    search=params[:search]
    Article.get_results(base_url+search)
    redirect_to root_path
  end
  

end
