local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
--local helpers = require("luasnip-helper-funcs")
--local get_visual = helpers.get_visual

return {
  -- math blackboard characters
  s({ trig = "bbs", condition = in_mathzone }, fmta("\\mathbb{S}", {})),
  -- math caligraphic characters
  s({ trig = "calf", condition = in_mathzone }, fmta("\\mathcal{F}", {})),
  -- characters with bar
  s({ trig = "brx", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\bar{x}", {})),
  s({ trig = "br0", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\bar{0}", {})),
  s({ trig = "bry", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\bar{y}", {})),
  -- function characters
  s({ trig = "pp", condition = in_mathzone, snippetType = "autosnippet" }, fmta("(p)", {})),
  s({ trig = "fp", condition = in_mathzone, snippetType = "autosnippet" }, fmta("f(p)", {})),
  s({ trig = "gp", condition = in_mathzone, snippetType = "autosnippet" }, fmta("g(p)", {})),
  s({ trig = "gfp", condition = in_mathzone, snippetType = "autosnippet" }, fmta("g\\circ f(p)", {})),
  -- greek letters
  s({ trig = ";L", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\Lambda", {})),
  s({ trig = ";l", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\lambda", {})),
  s({ trig = ";m", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mu", {})),
  s({ trig = ";e", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\varepsilon", {})),
  s({ trig = ";a", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\alpha", {})),
  s({ trig = ";b", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\beta", {})),
  s({ trig = ";t", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\theta", {})),
  -- tuples
  s({ trig = "xtup", condition = in_mathzone, snippetType = "autosnippet" }, fmta("(x_{1},...,x_{n})", {})),
}
