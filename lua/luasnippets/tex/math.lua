-- comprobar si estamos en entorno matematico, usa vimtex in_mathzone
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
    { trig = "ff", condition = in_mathzone, snippetType = "autosnippet" },
    fmta("\\frac{<>}{<>}", {
      i(1),
      i(2),
    })
  ),
  s(
    { trig = "([%a%)%]%}])00", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>_{<>}", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      t("0"),
    })
  ),
  s(
    { trig = "([^%a])mm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>$<>$", {
      f(function(_, snip)
        return snip.captures[1]
      end),
      d(1, get_visual),
    })
  ),
  s({ trig = "n-", condition = in_text, snippetType = "autosnippet" }, fmta("$n$-", {})),
  s(
    { trig = "_", condition = in_mathzone, wordTrig = false, snippetType = "autosnippet" },
    fmta("_{<>}", {
      d(1, get_visual),
    })
  ),
}
