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

  def attachments?
    (!attachment_1_url.nil? ||
     !attachment_2_url.nil? ||
     !attachment_3_url.nil? ||
     !attachment_4_url.nil? ||
     !attachment_5_url.nil?)
  end

  def attachments
    act_attachments = []
    if !attachment_1_url.nil?
      act_attachments << 
        { ident: self.attachment_1_identifier, url: self.attachment_1_url }
    end
    if !attachment_2_url.nil?
      act_attachments << 
        { ident: self.attachment_2_identifier, url: self.attachment_2_url }
    end
    if !attachment_3_url.nil?
      act_attachments << 
        { ident: self.attachment_3_identifier, url: self.attachment_3_url }
    end
    if !attachment_4_url.nil?
      act_attachments << 
        { ident: self.attachment_4_identifier, url: self.attachment_4_url }
    end
    if !attachment_5_url.nil?
      act_attachments << 
        { ident: self.attachment_5_identifier, url: self.attachment_5_url }
    end
    act_attachments
  end
end
