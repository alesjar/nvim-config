local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
local in_text = function()
  return not in_mathzone()
end

local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual

--local conditions = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

return {
  s(
    {
      trig = "st",
      wordTrig = true,
      condition = in_mathzone * conds_expand.trigger_not_preceded_by("\\"),
      snippetType = "autosnippet",
    },
    fmta([[\left\{ <> \right\}]], {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "ra", condition = in_mathzone },
    fmta("\\left\\langle <> \\right\\rangle", {
      d(1, get_visual),
    })
  ),
}
