ActiveAdmin.register Comment, as: 'PostComment' do
  permit_params :id, :body

   controller do
     defaults resource_class: Comment, collection_name: 'comments', instance_name: 'comment'
   end
end
