--initilize Share
local title = "AppcodingEasy.com - Share button in Gideros app"
local url = "http://appcodingeasy.com/Gideros-Mobile/Share-button-in-Gideros-app"
local sharer = Share.new(title, url)

--create holder for button
--for easier positioning
local holder = Sprite.new()

--get all buttons
local buttons = sharer:getAll()

--add buttons to holder
for i,button in pairs(buttons) do
	button:setPosition(0, holder:getHeight())
	holder:addChild(button)
end

--positione holder in center
local hmiddle = (application:getContentWidth()-holder:getWidth())/2
local vmiddle = (application:getContentHeight()-holder:getHeight())/2
holder:setPosition(hmiddle, vmiddle)

--add holder to stage
stage:addChild(holder)