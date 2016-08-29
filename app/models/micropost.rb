class Micropost < ActiveRecord::Base

	 belongs_to :user
    has_many :picattachments, dependent: :destroy

# accepts_nested_attributes_for :picattachments

	  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end

     def images

  Picattachment.image_attachment(self)

  end

end