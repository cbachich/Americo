# == Schema Information
#
# Table name: sheets
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)
#  subtitle   :string(255)
#

require 'spec_helper'

describe Sheet do
  pending "add some examples to (or delete) #{__FILE__}"
end
