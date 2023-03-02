local ls = require("luasnip") --{{{
local s = ls.s
local i = ls.i
local t = ls.t

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("CPP Snippets", { clear = true })
local file_pattern = "*.cpp"

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}

-- start snippets
local competitiveProgrammingStarter = s("cp", {
  t("#include <bits/stdc++.h>"),
  t({"", "using namespace std;"}),
  t({"", ""}),
  t({"", "int main() {"}),
  t({"", "\tios_base::sync_with_stdio(0);"}),
  t({"", "\tcin.tie(0);"}),
  t({"", "\tcout.tie(0);"}),
  t({"", ""}),
  t({"", "\t"}),
  i(1),
  t({"", ""}),
  t({"", "\treturn 0;"}),
  t({"", "}"}),
})
table.insert(snippets, competitiveProgrammingStarter)

local whileT = s("wt", {
  t("int t;"),
  t({"", "cin >> t;"}),
  t({"", "while (t--) {"}),
  t({"", "\t"}),
  i(1),
  t({"", "}"}),
})
table.insert(snippets, whileT)

-- end snippets


return snippets, autosnippets
