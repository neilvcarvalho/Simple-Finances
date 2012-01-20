class Reserve < ActiveRecord::Base
  attr_accessible :sum, :conta, :description, :conta_id
  belongs_to :conta
end
