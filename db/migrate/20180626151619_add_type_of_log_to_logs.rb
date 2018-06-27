class AddTypeOfLogToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :type_of_log, :string
  end
end
