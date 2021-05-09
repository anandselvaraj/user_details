class User < ApplicationRecord
    has_secure_password
    enum role: [:staff, :manager, :admin]
    scope :filer_by_role, ->(role) { where("role <= ?", self.roles[role]) }

    def full_name
    	"#{self.first_name} #{self.last_name}"
    end
end
