return {
  "L3MON4D3/LuaSnip",
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",
  opts = {
    enable_autosnippets = true,
    store_selection_keys = "<Tab>",
    update_events = "TextChanged, TextChangedI",
  },
  config = function(_, opts)
    require("luasnip").config.set_config(opts)

    require("luasnip.loaders.from_lua").lazy_load({
      paths = { vim.fn.stdpath("config") .. "/lua/luasnippets" },
    })
  end,
}
