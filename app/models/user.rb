class User < ActiveRecord::Base
	has_secure_password

	validates :name,
						uniqueness: true,
						presence: true
	validates :email,
						uniqueness: true
	validates :password,
						length: { minimum: 3 }
end
