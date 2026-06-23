local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
--local helpers = require("luasnip-helper-funcs")
--local get_visual = helpers.get_visual

return {
  -- math blackboard characters
  s({ trig = "bbs", condition = in_mathzone }, fmta("\\mathbb{S}", {})),
  -- math caligraphic characters
  s({ trig = "acal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{A}", {})),
  s({ trig = "bcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{B}", {})),
  s({ trig = "ccal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{C}", {})),
  s({ trig = "dcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{D}", {})),
  s({ trig = "ecal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{E}", {})),
  s({ trig = "fcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{F}", {})),
  s({ trig = "gcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{G}", {})),
  s({ trig = "hcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{H}", {})),
  s({ trig = "ical", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{I}", {})),
  s({ trig = "jcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{J}", {})),
  s({ trig = "kcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{K}", {})),
  s({ trig = "lcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{L}", {})),
  s({ trig = "mcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{M}", {})),
  s({ trig = "ncal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{N}", {})),
  s({ trig = "ocal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{O}", {})),
  s({ trig = "pcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{P}", {})),
  s({ trig = "qcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{Q}", {})),
  s({ trig = "rcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{R}", {})),
  s({ trig = "scal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{S}", {})),
  s({ trig = "tcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{T}", {})),
  s({ trig = "ucal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{U}", {})),
  s({ trig = "vcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{V}", {})),
  s({ trig = "wcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{W}", {})),
  s({ trig = "xcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{X}", {})),
  s({ trig = "ycal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{Y}", {})),
  s({ trig = "zcal", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\mathcal{Z}", {})),
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
  s({ trig = ";f", condition = in_mathzone, snippetType = "autosnippet" }, fmta("\\varphi", {})),
  -- tuples
  s({ trig = "xtup", condition = in_mathzone, snippetType = "autosnippet" }, fmta("(x_{1},...,x_{n})", {})),
}
