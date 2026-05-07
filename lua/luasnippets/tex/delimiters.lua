local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
local in_text = function()
  return not in_mathzone()
end

local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual

return {
  s(
    { trig = "set", condition = in_mathzone, snippetType = "autosnippet" },
    fmta("\\left\\{ <> \\right\\}", {
      i(1),
    })
  ),
  s(
    { trig = "ra", condition = in_mathzone },
    fmta("\\left\\langle <> \\right\\rangle", {
      d(1, get_visual),
    })
  ),
}
