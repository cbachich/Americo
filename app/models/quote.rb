# == Schema Information
#
# Table name: quotes
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  email        :string(255)
#  phone        :string(255)
#  company      :string(255)
#  comments     :text
#  attachment_1 :string(255)
#  attachment_2 :string(255)
#  attachment_3 :string(255)
#  attachment_4 :string(255)
#  attachment_5 :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Quote < ActiveRecord::Base
  mount_uploader :attachment_1, QuoteUploader
  mount_uploader :attachment_2, QuoteUploader
  mount_uploader :attachment_3, QuoteUploader
  mount_uploader :attachment_4, QuoteUploader
  mount_uploader :attachment_5, QuoteUploader
  
  attr_accessible :name,
                  :email,
                  :phone,
                  :company,
                  :comments,
                  :attachment_1, 
                  :attachment_2, 
                  :attachment_3, 
                  :attachment_4, 
                  :attachment_5

end
