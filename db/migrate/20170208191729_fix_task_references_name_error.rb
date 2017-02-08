class FixTaskReferencesNameError < ActiveRecord::Migration[5.0]
  def change
    change_table :tasks do |t|
      t.rename :project_id_id, :project_id
    end
  end
end
