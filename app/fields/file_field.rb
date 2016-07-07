require "administrate/field/base"

class FileField < Administrate::Field::Base
  def to_s
    data.humanize
  end
end
