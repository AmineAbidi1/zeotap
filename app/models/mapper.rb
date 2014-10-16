#encoding:utf-8
class Mapper < ActiveRecord::Base
  validates :string1, :string2, presence: true
end