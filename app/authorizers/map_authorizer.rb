class MapAuthorizer < ApplicationAuthorizer
  def self.creatable_by?(user)
    true
  end

  def updatable_by?(user)
    resource.creator == user || user.has_role?(:admin)
  end

  def deletable_by?(user)
    resource.creator == user || user.has_role?(:admin)
  end
end
