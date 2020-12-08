ActiveAdmin.register Customer do
  permit_params :full_name, :billing_address, :shipping_address, :province_id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
end
