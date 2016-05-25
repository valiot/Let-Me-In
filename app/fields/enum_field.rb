require 'administrate/field/base'

class EnumField < Administrate::Field::Base
  def to_s
    data.humanize
  end
end
