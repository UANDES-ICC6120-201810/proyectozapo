# ------------- Aqui se define los endpoints con respecto a la tabla 'Operator' -------------
module API
  module V1
    class Operators < Grape::API
      include API::V1::Defaults
      resource :operators do
        desc "Return all operators"
        get "", root: :operators do
          Operator.all
        end

        desc "Return a operator"
        params do
          requires :id, type: String, desc: "ID of the operator"
        end
        get ":id", root: "operator" do
          Operator.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end