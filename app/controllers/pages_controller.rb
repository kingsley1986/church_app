class PagesController < ApplicationController

  def index
    case params[:scope]
    when 'children', 'youth', 'women', 'food', 'community', 'hospital', 'sunday', 'tuesday', 'thursday',  'contact', 'home', 'about_redeedemed', 'about_go', 'about_parish_pastor', 'about', 'fridaynightvigil', 'lunchhourprayer'
      @pages = Page.send(params[:scope])
    end

    # hash = { 'children' => 1, 'youth' => 1,}
    # if hash[params[:scope]] == 1
    #   @pages = Page.send(params[:scope])
    # end
  end

  private

  def page_params
    params.require(:page).permit(:body, :page_type, pictures_attributes: [:id, :page_id, :image])
  end
end
