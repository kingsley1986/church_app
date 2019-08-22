module PagesHelper

  def sorted_pages
    Page.all.each do |u|
      u
    end
  end

  def sunday
    a = []
    u  = Page.where(page_type: "Sunday").first
    u.pictures.each do |n|
    a << n.image.url(:medium)
    end
    return a
  end

  #
  # def children_page
  #
  #   case Page.find(params[:id])
  #
  #     when f.page_type = "Childrens"
  #       Page.find_by_page_type("Children")
  #     end
  #
  # end
end
