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
  -- function characters
  s({ trig = "pp", condition = in_mathzone, snippetType = "autosnippet" }, fmta("(p)", {})),
  s({ trig = "fp", condition = in_mathzone, snippetType = "autosnippet" }, fmta("f(p)", {})),
  s({ trig = "gp", condition = in_mathzone, snippetType = "autosnippet" }, fmta("g(p)", {})),
  s({ trig = "gfp", condition = in_mathzone, snippetType = "autosnippet" }, fmta("g\\circ f(p)", {})),
  -- greek letters
  s({ trig = ";L", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\Lambda", {})),
}
