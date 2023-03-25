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

local customCPStarter = s("CP", {
  t("#include<bits/stdc++.h>"),
  t({ "", "#include <cassert>" }),
  t({ "", "#include <chrono>" }),
  t({ "", "#include <ctime>" }),
  t({ "", "using namespace std;" }),
  t({ "", "" }),
  t({ "", "#define fastio() ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL)" }),
  t({ "", "#define MOD 1e9+7" }),
  t({ "", "#define MOD1 998244353" }),
  t({ "", "#define INF 1e18" }),
  t({ "", '#define nline "\\n"' }),
  t({ "", "#define pb push_back" }),
  t({ "", "#define ppb pop_back" }),
  t({ "", "#define mp make_pair" }),
  t({ "", "#define ff first" }),
  t({ "", "#define ss second" }),
  t({ "", "#define PI 3.141592653589793238462" }),
  t({ "", "#define set_bits __builtin_popcountll" }),
  t({ "", "#define sz(x) ((int)(x).size())" }),
  t({ "", "#define all(x) (x).begin(), (x).end()" }),
  t({ "", "" }),
  t({ "", "typedef long long ll;" }),
  t({ "", "typedef unsigned long long ull;" }),
  t({ "", "typedef long double lld;" }),
  t({ "", "" }),
  t({ "", "#ifndef ONLINE_JUDGE" }),
  t({ "", '#define LOG(x) cerr << #x <<": "; _print(x); cerr << endl;' }),
  t({ "", "#else" }),
  t({ "", "#define LOG(x)" }),
  t({ "", "#endif" }),
  t({ "", "" }),
  t({ "", "void _print(ll t) {cerr << t;}" }),
  t({ "", "void _print(int t) {cerr << t;}" }),
  t({ "", "void _print(string t) {cerr << t;}" }),
  t({ "", "void _print(char t) {cerr << t;}" }),
  t({ "", "void _print(lld t) {cerr << t;}" }),
  t({ "", "void _print(double t) {cerr << t;}" }),
  t({ "", "void _print(ull t) {cerr << t;}" }),
  t({ "", "" }),
  t({ "", "template <class T, class V> void _print(pair <T, V> p);" }),
  t({ "", "template <class T> void _print(vector <T> v);" }),
  t({ "", "template <class T> void _print(set <T> v);" }),
  t({ "", "template <class T, class V> void _print(map <T, V> v);" }),
  t({ "", "template <class T> void _print(multiset <T> v);" }),
  t({
    "",
    'template <class T, class V> void _print(pair <T, V> p) {cerr << "{"; _print(p.ff); cerr << ","; _print(p.ss); cerr << "}";}',
  }),
  t({
    "",
    'template <class T> void _print(vector <T> v) {cerr << "[ "; for (T i : v) {_print(i); cerr << " ";} cerr << "]";}',
  }),
  t({
    "",
    'template <class T> void _print(set <T> v) {cerr << "[ "; for (T i : v) {_print(i); cerr << " ";} cerr << "]";}',
  }),
  t({
    "",
    'template <class T> void _print(multiset <T> v) {cerr << "[ "; for (T i : v) {_print(i); cerr << " ";} cerr << "]";}',
  }),
  t({
    "",
    'template <class T, class V> void _print(map <T, V> v) {cerr << "[ "; for (auto i : v) {_print(i); cerr << " ";} cerr << "]";}',
  }),
  t({ "", "const ll MAX_N = 1e6;" }),
  t({ "", "" }),
  t({ "", "int main() {" }),
  t({ "", "\t#ifndef ONLINE_JUDGE" }),
  t({ "", '\t\tFILE* file = freopen("DEBUG.o", "w", stderr);' }),
  t({ "", "\t\tif (file == NULL) {" }),
  t({ "", '\t\t\tfprintf(stderr, "Error: could not open debug file\\n");' }),
  t({ "", "\t\t\texit(EXIT_FAILURE);" }),
  t({ "", "\t\t}" }),
  t({ "", "\t\t\tauto start = chrono::high_resolution_clock::now();" }),
  t({ "", "\t#endif" }),
  t({ "", "fastio();" }),
  t({ "", "" }),
  i(1),
  t({ "", "" }),
  t({ "", "\t#ifndef ONLINE_JUDGE" }),
  t({ "", "\t\tauto stop = chrono::high_resolution_clock::now();" }),
  t({ "", "\t\tauto duration = chrono::duration_cast<chrono::milliseconds>(stop - start);" }),
  t({ "", '\t\tcerr << "----------------------------------" << endl;' }),
  t({ "", '\t\tcerr << "Execution time: " << duration.count() << " milliseconds" << endl;' }),
  t({ "", "\t\tauto currentTime = chrono::system_clock::to_time_t(chrono::system_clock::now());" }),
  t({ "", '\t\tcerr << "Finished at: " << ctime(&currentTime);' }),
  t({ "", "\t#endif" }),
  t({ "", "\treturn 0;" }),
  t({ "", "}" }),
})
table.insert(snippets, customCPStarter)

local whileT = s("wt", {
  t("int t;"),
  t({ "", "cin >> t;" }),
  t({ "", "while (t--) {" }),
  t({ "", "\t" }),
  i(1),
  t({ "", "}" }),
})
table.insert(snippets, whileT)

local cout = s("co", {
  t("cout << "),
  i(1),
  t(" <<  endl;"),
})
table.insert(snippets, cout)

-- end snippets

return snippets, autosnippets
