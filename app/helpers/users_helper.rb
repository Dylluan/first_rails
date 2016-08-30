module UsersHelper

	def avatar_for(user, v)
		unless user.avatar.blank?
		case v
		when "md"
			url= user.avatar.md 
		when "sm"
			url= user.avatar.sm
		else url=user.avatar
		end

		content_tag(:div, image_tag(url), class: "placeholder-#{v}" )
	else content_tag(:div,'' ,class: "placeholder-#{v}" )
end
	end
end