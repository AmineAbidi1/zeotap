#encoding:utf-8
class Mapper < ActiveRecord::Base
  validates :string1, :string2, presence: true
  validates_format_of :string1, :string2, :with => /\A[a-z]+\z/i
end