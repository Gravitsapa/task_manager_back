class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :priority, :deadline
end
