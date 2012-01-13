class Reserve < ActiveRecord::Base
  attr_accessible :sum, :conta, :description
  belongs_to :conta
end
