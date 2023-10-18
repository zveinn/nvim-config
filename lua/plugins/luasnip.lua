local luasnip_setup, luasnip = pcall(require, "cmp")
if not luasnip_setup then return end

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
luasnip.add_snippets("all", {
	s("s", {
		t({ "type " }), i(1), t({ " struct {", "\t", "}" }),
	})
})
luasnip.add_snippets("all", {
	s("e", {
		t({ "if err != nil {", '\treturn err', "}" }),
	})
})

luasnip.add_snippets("all", {
	s("d", {
		t(
			{ "defer func(){"
			, "\tr := recover()"
			, "\tif r != nil {"
			, "\t\tlog.Println(r, string(debug.Stack()))"
			, "\t}"
			, "}()"
			})
	})
})
