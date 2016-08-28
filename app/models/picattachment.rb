class Picattachment < ActiveRecord::Base

 belongs_to :micropost
mount_uploader :picture, AvatarUploader
end
