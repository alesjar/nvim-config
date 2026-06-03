-- From any snippet file, source `get_visual` from global helper functions file
local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual

return {
  -- Example: italic font implementing visual selection
  s(
    { trig = "tit", dscr = "Expands 'tii' into LaTeX's textit{} command." },
    fmta("\\textit{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "bf", dscr = "Expands 'bf' into LaTeX's textbf{} command." },
    fmta("\\textbf{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "bb", condition = in_mathzone, dscr = "Expands 'bb' into LaTeX's mathbb{} command." },
    fmta("\\mathbb{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    { trig = "cal", condition = in_mathzone, dscr = "Expands 'cal' into LaTeX's mathcal{} command." },
    fmta("\\mathcal{<>}", {
      d(1, get_visual),
    })
  ),
  s(
    {
      trig = "brr",
      condition = in_mathzone,
      snippetType = "autosnippet",
      dscr = "Expands 'brr' into LaTeX's bar{} command.",
    },
    fmta("\\bar{<>}", {
      d(1, get_visual),
    })
  ),
}
