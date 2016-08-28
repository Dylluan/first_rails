module UsersHelper

	def avatar_for(user, v)

		case v
		when "md"
			url= user.avatar.md 
		when "sm"
			url= user.avatar.sm
		end

		content_tag(:div, image_tag(url), class: "placeholder-#{v}" )

	end
end