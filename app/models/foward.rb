class Foward < ActiveRecord::Base
  validates :chat_id, uniqueness: { case_sensitive: false }
end
