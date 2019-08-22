ActiveAdmin.register Page do
  permit_params :body, :title, :page_type, pictures_attributes: [:id, :image, :_destroy ]

  form do |f|
    f.inputs "Page Details" do
       f.input :title
       f.input :body, as: :text
       f.select :page_type, Page::PAGE_TYPE
       f.has_many :pictures, allow_destroy: true do |ff|
         ff.input :image, multiple: true, name: "pictures[image][]", :as => :file, :hint => ff.object.image.present? ? ff.template.image_tag(ff.object.image.url(:medium)) : ''
       end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :body
      row :page_type
    end
      table_for Page.find(params[:id]).pictures do
        column :image do |a|
         image_tag a.image.url
       end
    end
  end

end
