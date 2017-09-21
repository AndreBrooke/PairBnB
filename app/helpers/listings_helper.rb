module ListingsHelper

	def link_to_toggle_listing_verify(listing)
		url = listing_verify_path(listing)
		
		if listing.verified?
			link_to_with_icon('glyphicon glyphicon-ok', 'Verify', url, {
				method: 'DELETE',
				remote: true,
				class: 'btn btn-primary',
				})
		else
			link_to_with_icon('glyphicon glyphicon-remove', 'Unverify', url, {
				method: 'PUT',
				remote: true,
				class: 'btn btn-primary',
				})
		end
	end

	def link_to_with_icon(icon_css, title, url, options = {})
		icon = content_tag(:i, nil, class: icon_css)
		title_with_icon = icon << ' '.html_safe << h(title)
		link_to(title_with_icon, url, options)
	end
end
