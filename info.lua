-- Begin myinfo.lua
local function run(msg, matches)
	if matches[1]:lower() == '' then
		function get_id(arg, data)
			local username
			if data.first_name_ then
				if data.username_ then
					username = '@'..data.username_
				else
					username = '<i>.</i>'
				end
				local telNum
				if data.phone_number_ then
					telNum = '+'..data.phone_number_
				else
					telNum = '.'
				end
				local lastName
				if data.last_name_ then
					lastName = data.last_name_
				else
					lastName = '.'
				end
				local rank
				if is_sudo(msg) then
					rank = ' '
				elseif is_owner(msg) then
					rank = ' '
				elseif is_admin(msg) then
					rank = ''
				elseif is_mod(msg) then
					rank = ''
				else
					rank = ' '
				end
				local text = '<b> :</b>\n<b>:</b> <i>'..data.first_name_..'</i>\n<b> :</b> <i>'..lastName..'</i>\n<b>:</b> '..username..'\n<b>:</b> [ <code>'..data.id_..'</code> ]\n<b> :</b> [ <code>'..arg.chat_id..'</code> ]\n<b> :</b> [ <code>'..telNum..'</code> ]\n<b>:</b> <i>'..rank..'</i>'
				tdcli.sendMessage(arg.chat_id, msg.id_, 1, text, 1, 'html')
			end
		end
		tdcli_function({ ID = 'GetUser', user_id_ = msg.sender_user_id_, }, get_id, {chat_id=msg.chat_id_, user_id=msg.sendr_user_id_})
	end
end

return { patterns = { "^()$" }, run = run }

-- END
