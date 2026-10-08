local in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
local in_text = function()
  return not in_mathzone()
end

local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual
local events = require("luasnip.util.events")

local function coefficient_node(jump, variable)
  return i(jump, "", {
    node_callbacks = {
      [events.leave] = function(node)
        local value = table.concat(node:get_text(), "\n")
        if not value:match("^%s*[+-]?%s*0%s*$") then
          return
        end

        -- Remove this coefficient and its x_j, leaving the array cell empty.
        local positions = node:get_buf_position({ raw = true })
        local from = positions[1]
        local buffer = vim.api.nvim_get_current_buf()
        local line = vim.api.nvim_buf_get_lines(buffer, from[1], from[1] + 1, false)[1] or ""
        local last_col = from[2] + #value + #variable
        if line:sub(from[2] + 1, last_col) == value .. variable then
          vim.api.nvim_buf_set_text(buffer, from[1], from[2], from[1], last_col, {})
        end
      end,
    },
  })
end

return {
  s(
    { trig = "([%a][%a]?)vvc", regTrig = true, wordTrig = false, condition = in_mathzone, snippetType = "autosnippet" },
    fmta("\\vvc{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]:sub(1, 1)
      end),
      f(function(_, snip)
        return snip.captures[1]:sub(2, 2)
      end),
    })
  ),
  s(
    { trig = "([%a][%a]?)hvc", regTrig = true, wordTrig = false, condition = in_mathzone, snippetType = "autosnippet" },
    fmta("\\hvc{<>}{<>}", {
      f(function(_, snip)
        return snip.captures[1]:sub(1, 1)
      end),
      f(function(_, snip)
        return snip.captures[1]:sub(2, 2)
      end),
    })
  ),
  s(
    { trig = "lss", snippetType = "autosnippet" },
    fmta("\\linsys{<>}{<>}{<>}{<>}{<>}", {
      i(1),
      i(2),
      i(3),
      i(4),
      i(5),
    })
  ),
  snippetType = "autosnippet",
  s(
    {
      trig = "(%a)(%a)([%a0])(%a?)(%a?)ls",
      trigEngine = "pattern",
      snippetType = "autosnippet",
      condition = in_mathzone,
      wordTrig = true,
    },
    f(function(_, snip)
      local c = snip.captures
      return ("\\linsys{%s}{%s}{%s}{%s}{%s}"):format(c[1], c[2], c[3], c[4] or "", c[5] or "")
    end, {})
  ),
  s({
    trig = "([1-9])([1-9])mx",
    regTrig = true,
    wordTrig = false,
    condition = in_mathzone,
    snippetType = "autosnippet",
  }, {
    d(1, function(_, parent)
      local rows = tonumber(parent.snippet.captures[1])
      local cols = tonumber(parent.snippet.captures[2])
      local nodes = { t({ "\\begin{pmatrix}", "" }) }

      for row = 1, rows do
        for col = 1, cols do
          nodes[#nodes + 1] = i((row - 1) * cols + col)
          if col < cols then
            nodes[#nodes + 1] = t(" & ")
          end
        end
        if row < rows then
          nodes[#nodes + 1] = t({ [[ \\]], "" })
        end
      end

      nodes[#nodes + 1] = t({ "", "\\end{pmatrix}" })
      return sn(nil, nodes)
    end, {}),
    i(0),
  }),
  s({
    trig = "([1-9])([1-9])lx",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
  }, {
    d(1, function(_, parent)
      local rows = tonumber(parent.snippet.captures[1])
      local vars = tonumber(parent.snippet.captures[2])
      -- Right-align each variable term; type + or - in its insert node.
      local columns = "@{}r"
      for col = 2, vars do
        columns = columns .. "@{\\;}r"
      end
      columns = columns .. "@{\\;=\\;}l@{}"

      local nodes = {
        t({ "\\left\\{", "\\begin{array}{" .. columns .. "}", "" }),
      }
      local jump = 1

      for row = 1, rows do
        for col = 1, vars do
          local variable = "x_{" .. col .. "}"
          nodes[#nodes + 1] = coefficient_node(jump, variable)
          jump = jump + 1
          nodes[#nodes + 1] = t(variable)
          if col < vars then
            nodes[#nodes + 1] = t(" & ")
          end
        end

        nodes[#nodes + 1] = t(" & ")
        nodes[#nodes + 1] = i(jump)
        jump = jump + 1
        if row < rows then
          nodes[#nodes + 1] = t({ [[ \\]], "" })
        end
      end

      nodes[#nodes + 1] = t({ "", "\\end{array}", "\\right." })
      return sn(nil, nodes)
    end, {}),
    i(0),
  }),
  s(
    {
      trig = "([%a])([%w])ns",
      regTrig = true,
      wordTrig = false,
      condition = in_mathzone,
      snippetType = "autosnippet",
    },
    fmta("(<>_{<>})", {
      f(function(_, snip)
        return snip.captures[1]:upper()
      end),
      f(function(_, snip)
        return snip.captures[2]
      end),
    })
  ),
}
