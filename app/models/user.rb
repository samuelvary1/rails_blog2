class User < ActiveRecord::Base
  
  attr_accessor :email, :password, :password_confirmation
  # attr_reader :password_hash
  # has_many :roles, :through => :assignments
  
  # before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email


  # ROLES = %w[admin moderator author]

  # def role_symbols
  #   roles.map do |role|
  #     role.name.underscore.to_sym
  #   end
  # end


  # def encrypt_password
  #   if password.present?
  #     self.password_salt = BCrypt::Engine.generate_salt
  #     self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  #   end
  # end
end