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

require 'spec_helper'

describe Quote do
  pending "add some examples to (or delete) #{__FILE__}"
end
