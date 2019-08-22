ActiveAdmin.register Home do
  permit_params :body, pictures_attributes: [:id, :image, :_destroy ]

  form do |f|
    f.inputs "Home Page Details" do
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
      row :body
    end
      table_for home.pictures do
        column :image do |a|
         image_tag a.image.url(:medium)
       end
    end
  end

end
