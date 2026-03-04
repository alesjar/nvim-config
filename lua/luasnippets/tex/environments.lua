return {
  -- Code for environment snippet in the above GIF
  s(
    { trig = "env", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1), -- this node repeats insert node i(1)
      }
    )
  ),
  s(
    { trig = "bef" },
    fmta(
      [[
        \begin{figure}[h]
          \includegraphics[scale=<>]{imagenes/<>}
          \label{fig:<>}
        \end{figure}
      ]],
      {
        i(1, "0.25"),
        i(2),
        rep(2),
      }
    )
  ),
  s(
    { trig = "befc" },
    fmta(
      [[
        \begin{figure}[h]
          \includegraphics[scale=<>]{imagenes/<>}
          \label{fig:<>}
          \caption{<>}
        \end{figure}
      ]],
      {
        i(1, "0.25"),
        i(2),
        rep(2),
        i(3),
      }
    )
  ),
}
