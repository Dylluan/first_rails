class Picattachment < ActiveRecord::Base

 belongs_to :micropost
mount_uploader :picture, AvatarUploader


def self.image_attachment(micropost)
    # images_ids = "SELECT picattachment_id FROM picattachments
    #                      WHERE micropost_id = :micropost_id"
    # where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
    #       user_id: user.id)
   Picattachment.where("micropost_id = ?", micropost.id)
  end
end
