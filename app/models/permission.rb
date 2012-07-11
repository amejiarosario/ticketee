class Permission < ActiveRecord::Base
  attr_accessible :action, :user, :thing
  belongs_to :user
  belongs_to :thing,  polymorphic: true
end
