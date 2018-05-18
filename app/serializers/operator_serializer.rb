# ------------- Aqui se definen los atributos de la tabla y sus nombres que se van a mostrar en el JSON -------------
class OperatorSerializer < ActiveModel::Serializer
  attributes def operator_name
    object.name
  end,
  def operator_number
    object.operator_number
  end
end