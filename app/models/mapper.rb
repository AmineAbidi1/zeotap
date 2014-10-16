#encoding:utf-8
class Mapper < ActiveRecord::Base
  validates :string1, :string2, presence: true
  validates_format_of :string1, :string2, :with => /\A[0-9a-z]+\z/i
  validates_length_of :string1, :string2, :maximum => 40
end