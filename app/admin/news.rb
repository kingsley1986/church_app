ActiveAdmin.register News do
  permit_params :title, :body, pictures_attributes: [:id, :image, :_destroy ]

  form do |f|
    f.inputs "News Page Details" do
       f.input :title
       f.input :body, as: :text
       f.has_many :pictures do |ff|
         ff.input :image, :as => :file, :hint => ff.object.image.present? ? ff.template.image_tag(ff.object.image.url(:medium)) : ''
       end
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :body
    end
      table_for news.pictures do
        column :image do |a|
         image_tag a.image.url(:medium)
       end
    end
  end
end
