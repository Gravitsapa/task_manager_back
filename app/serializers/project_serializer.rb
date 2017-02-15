class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :tasks

  def tasks
    object.tasks.order(priority: :desc, updated_at: :asc)
  end
end
