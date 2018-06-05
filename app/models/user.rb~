class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password

  after_destroy :ensure_an_admin_remains

  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "I'm sorry Dave, I can't let you delete the last user"
      end
    end     
end
