function data()
return {
	info = {
		minorVersion = 0,
		severityAdd = "NONE",
		severityRemove = "WARNING",
		name = _("mod_name"),
		description = _("mod_desc"),
		authors = {
		    {
		        name = "ModWerkstatt",
		        role = "CREATOR",
		    },
		},
		tags = { "europe", "deutschland", "germany", "db" },
		minGameVersion = 0,
        params = {
			{
				key = "et27fake",
				name = _("Fake_et27"),
				values = { "No", "Yes", },
				tooltip = _("option_fake_et27_desc"),
				defaultIndex = 0,
			},
		},
		dependencies = { },
		url = { "" },
	},
	options = {
	},

	runFn = function (settings, modParams)

	    local hidden_et27 = {
			["ar_fake.lua"] = true,
			["ob_fake.lua"] = true,
        }

		local modelFilter_et27 = function(fileName, data)
			local modelName = fileName:match('/et27_([^/]*.lua)')
			return (modelName==nil or hidden_et27[modelName]~=true)
		end
        local modelFilter_br427 = function(fileName, data)
			local modelName = fileName:match('/br427_([^/]*.lua)')
			return (modelName==nil or hidden_et27[modelName]~=true)
		end

		if modParams[getCurrentModId()] ~= nil then
			local params = modParams[getCurrentModId()]
			if params["et27fake"] == 0 then
				addFileFilter("multipleUnit", modelFilter_et27)
                addFileFilter("multipleUnit", modelFilter_br427)
			end
		else
			addFileFilter("multipleUnit", modelFilter_et27)
            addFileFilter("multipleUnit", modelFilter_br427)
		end
	end
	}
end
