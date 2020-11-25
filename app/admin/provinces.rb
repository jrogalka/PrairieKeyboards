ActiveAdmin.register Province do
  permit_params :name, :abbreviation, :pst, :gst
end
