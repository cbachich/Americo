# == Schema Information
#
# Table name: pictures
#
#  id         :integer          not null, primary key
#  page_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string(255)
#

require 'spec_helper'

describe Picture do
  pending "add some examples to (or delete) #{__FILE__}"
end
