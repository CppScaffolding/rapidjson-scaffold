-- scaffold geniefile for rapidjson

rapidjson_script = path.getabsolute(path.getdirectory(_SCRIPT))
rapidjson_root = path.join(rapidjson_script, "rapidjson")

rapidjson_includedirs = {
	path.join(rapidjson_script, "config"),
	rapidjson_root,
}

rapidjson_libdirs = {}
rapidjson_links = {}
rapidjson_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { rapidjson_includedirs }
	end,

	_add_defines = function()
		defines { rapidjson_defines }
	end,

	_add_libdirs = function()
		libdirs { rapidjson_libdirs }
	end,

	_add_external_links = function()
		links { rapidjson_links }
	end,

	_add_self_links = function()
		links { "rapidjson" }
	end,

	_create_projects = function()

project "rapidjson"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		rapidjson_includedirs,
	}

	defines {}

	files {
		path.join(rapidjson_script, "config", "**.h"),
		path.join(rapidjson_root, "**.h"),
		path.join(rapidjson_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
