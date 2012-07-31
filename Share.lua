--[[
*************************************************************
* This script is developed by Arturs Sosins aka ar2rsawseen, http://appcodingeasy.com
* Feel free to distribute and modify code, but keep reference to its creator
*
* Share class provides a way to put share button for popular social portals in your Gideros app.
* You can provide URL to your app website or market/appstore link and proposed title 
* for your app users to share.
*
* For more information, examples and online documentation visit: 
* http://appcodingeasy.com/Gideros-Mobile/Share-button-in-Gideros-app
**************************************************************
]]--


Share = gideros.class(EventDispatcher)

--initialize
function Share:init(title, url, config)
	-- Settings
	self.conf = {
		facebook = "facebook.png",
		twitter = "twitter.png"
	}
	
	self.urls = {
		facebook = "http://www.facebook.com/sharer.php?u="..url.."&t="..title, 
		twitter = "http://twitter.com/home?status="..title..": "..url
	}
	
	if config then
		--copying configuration
		for key,value in pairs(config) do
			self.conf[key]= value
		end
	end
end

function Share:getButton(name)
	local button
	if self.conf[name] then
		button = Bitmap.new(Texture.new(self.conf[name]))
		button.url = self.urls[name]
		function button:click(e)
			if self:hitTestPoint(e.x, e.y) then
				application:openUrl(self.url)
			end
		end
		button:addEventListener(Event.MOUSE_DOWN, button.click, button)
	end
	return button
end

function Share:getAll()
	local buttons = {}
	for i in pairs(self.conf) do
		buttons[i] = self:getButton(i)
	end
	return buttons
end