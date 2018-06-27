class OperatorSerializer < ActiveModel::Serializer
  attributes def operator_name
    object.name
  end,
  def operator_number
    object.operator_number
  end
end