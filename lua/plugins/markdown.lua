local rendered_callout = {
  note = "󰋽 Note",
  tip = "󰌶 Tip",
  important = "󰅾 Important",
  warning = "󰀪 Warning",
  caution = "󰳦 Caution",
  abstract = "󰨸 Abstract",
  todo = "󰗡 Todo",
  success = "󰄬 Success",
  question = "󰘥 Question",
  failure = "󰅖 Failure",
  danger = "󱐌 Danger",
  bug = "󰨰 Bug",
  example = "󰉹 Example",
  quote = "󱆨 Quote",
}

vim.api.nvim_create_user_command('ShowCalloutOptions', function()
  for _, value in pairs(rendered_callout) do
    print(value)
  end
end, { desc = "Mostrar los callout disponibles en render_markdown" })

return {
  {
    'MeanderingProgrammer/markdown.nvim',
    VeryLazy = true,
    opts = {
      enabled = true,
      max_file_size = 1.5,
      markdown_query = [[
        (atx_heading [
            (atx_h1_marker)
            (atx_h2_marker)
            (atx_h3_marker)
            (atx_h4_marker)
            (atx_h5_marker)
            (atx_h6_marker)
        ] @heading)

        (thematic_break) @dash

        (fenced_code_block) @code

        [
            (list_marker_plus)
            (list_marker_minus)
            (list_marker_star)
        ] @list_marker

        (task_list_marker_unchecked) @checkbox_unchecked
        (task_list_marker_checked) @checkbox_checked

        (block_quote) @quote

        (pipe_table) @table
    ]],
      -- Capture groups that get pulled from quote nodes
      markdown_quote_query = [[
        [
            (block_quote_marker)
            (block_continuation)
        ] @quote_marker
    ]],
      -- Capture groups that get pulled from inline markdown
      inline_query = [[
        (code_span) @code

        (shortcut_link) @callout

        [(inline_link) (full_reference_link) (image)] @link
    ]],
      inline_link_query = '[(inline_link) (full_reference_link) (image)] @link',
      log_level = 'error',
      file_types = { 'markdown', 'vimwiki' },
      render_modes = { 'n', 'c' },
      exclude = {
        buftypes = {},
      },
      anti_conceal = {
        -- This enables hiding any added text on the line the cursor is on
        -- This does have a performance penalty as we must listen to the 'CursorMoved' event
        enabled = false,
      },
      latex = {
        -- Whether LaTeX should be rendered, mainly used for health check
        enabled = false,
        -- Executable used to convert latex formula to rendered unicode
        converter = 'latex2text',
        -- Highlight for LaTeX blocks
        highlight = 'RenderMarkdownMath',
      },
      heading = {
        -- Turn on / off heading icon & background rendering
        enabled = true,
        -- Turn on / off any sign column related rendering
        sign = true,
        -- Replaces '#+' of 'atx_h._marker'
        -- The number of '#' in the heading determines the 'level'
        -- The 'level' is used to index into the array using a cycle
        -- The result is left padded with spaces to hide any additional '#'
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        -- Added to the sign column if enabled
        -- The 'level' is used to index into the array using a cycle
        signs = { '󰫎 ' },
        -- Width of the heading background:
        --  block: width of the heading text
        --  full: full width of the window
        width = 'block',
        backgrounds = {
          'RenderMarkdownH1bg',
          'RenderMarkdownH2bg',
          'RenderMarkdownH3bg',
          'RenderMarkdownH4bg',
          'RenderMarkdownH5bg',
          'RenderMarkdownH6bg',
        },
        foregrounds = {
          'RenderMarkdownH1',
          'RenderMarkdownH2',
          'RenderMarkdownH3',
          'RenderMarkdownH4',
          'RenderMarkdownH5',
          'RenderMarkdownH6',
        },
      },
      code = {
        -- Turn on / off code block & inline code rendering
        enabled = true,
        -- Turn on / off any sign column related rendering
        sign = false,
        -- Determines how code blocks & inline code are rendered:
        --  none: disables all rendering
        --  normal: adds highlight group to code blocks & inline code, adds padding to code blocks
        --  language: adds language icon to sign column if enabled and icon + name above code blocks
        --  full: normal + language
        style = 'language',
        -- Amount of padding to add to the left of code blocks
        left_pad = 0,
        -- Determins how the top / bottom of code block are rendered:
        --  thick: use the same highlight as the code body
        --  thin: when lines are empty overlay the above & below icons
        border = 'thin',
        -- Used above code blocks for thin border
        above = '▄',
        -- Used below code blocks for thin border
        below = '▀',
        -- Highlight for code blocks & inline code
        highlight = 'RenderMarkdownCode',
      },
      dash = {
        -- Turn on / off thematic break rendering
        enabled = true,
        -- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
        -- The icon gets repeated across the window's width
        icon = '─',
        -- Highlight for the whole line generated from the icon
        highlight = 'RenderMarkdownDash',
      },
      bullet = {
        -- Turn on / off list bullet rendering
        enabled = true,
        -- Replaces '-'|'+'|'*' of 'list_item'
        -- How deeply nested the list is determines the 'level'
        -- The 'level' is used to index into the array using a cycle
        -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
        icons = { '●', '○', '◆', '◇' },
        -- Highlight for the bullet icon
        highlight = 'RenderMarkdownBullet',
      },
      -- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'
      -- There are two special states for unchecked & checked defined in the markdown grammar
      checkbox = {
        -- Turn on / off checkbox state rendering
        enabled = true,
        unchecked = {
          -- Replaces '[ ]' of 'task_list_marker_unchecked'
          icon = '󰄱 ',
          -- Highlight for the unchecked icon
          highlight = 'RenderMarkdownUnchecked',
        },
        checked = {
          -- Replaces '[x]' of 'task_list_marker_checked'
          icon = '󰱒 ',
          -- Highligh for the checked icon
          highlight = 'RenderMarkdownChecked',
        },
        -- Define custom checkbox states, more involved as they are not part of the markdown grammar
        -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
        -- Can specify as many additional states as you like following the 'todo' pattern below
        --   The key in this case 'todo' is for healthcheck and to allow users to change its values
        --   'raw': Matched against the raw text of a 'shortcut_link'
        --   'rendered': Replaces the 'raw' value when rendering
        --   'highlight': Highlight for the 'rendered' icon
        custom = {
          todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
        },
      },
      quote = {
        -- Turn on / off block quote & callout rendering
        enabled = true,
        -- Replaces '>' of 'block_quote'
        icon = '▋',
        -- Highlight for the quote icon
        highlight = 'RenderMarkdownQuote',
      },
      pipe_table = {
        -- Turn on / off pipe table rendering
        enabled = true,
        -- Determines how the table as a whole is rendered:
        --  none: disables all rendering
        --  normal: applies the 'cell' style rendering to each row of the table
        --  full: normal + a top & bottom line that fill out the table when lengths match
        style = 'full',
        -- Determines how individual cells of a table are rendered:
        --  overlay: writes completely over the table, removing conceal behavior and highlights
        --  raw: replaces only the '|' characters in each row, leaving the cells unmodified
        --  padded: raw + cells are padded with inline extmarks to make up for any concealed text
        cell = 'padded',
        -- Gets placed in delimiter row for each column, position is based on alignmnet
        alignment_indicator = '━',
        -- Characters used to replace table border
        -- Correspond to top(3), delimiter(3), bottom(3), vertical, & horizontal
        -- stylua: ignore
        border = {
          '┌', '┬', '┐',
          '├', '┼', '┤',
          '└', '┴', '┘',
          '│', '─',
        },
        -- Highlight for table heading, delimiter, and the line above
        head = 'RenderMarkdownTableHead',
        -- Highlight for everything else, main table rows and the line below
        row = 'RenderMarkdownTableRow',
        -- Highlight for inline padding used to add back concealed space
        filler = 'RenderMarkdownTableFill',
      },
      -- Callouts are a special instance of a 'block_quote' that start with a 'shortcut_link'
      -- Can specify as many additional values as you like following the pattern from any below, such as 'note'
      --   The key in this case 'note' is for healthcheck and to allow users to change its values
      --   'raw': Matched against the raw text of a 'shortcut_link', case insensitive
      --   'rendered': Replaces the 'raw' value when rendering
      --   'highlight': Highlight for the 'rendered' text and quote markers
      callout = {
        note = { raw = '[!NOTE]', rendered = rendered_callout.note, highlight = 'RenderMarkdownInfo' },
        tip = { raw = '[!TIP]', rendered = rendered_callout.tip, highlight = 'RenderMarkdownSuccess' },
        important = { raw = '[!IMPORTANT]', rendered = rendered_callout.important, highlight = 'RenderMarkdownHint' },
        warning = { raw = '[!WARNING]', rendered = rendered_callout.warning, highlight = 'RenderMarkdownWarn' },
        caution = { raw = '[!CAUTION]', rendered = rendered_callout.caution, highlight = 'RenderMarkdownError' },
        abstract = { raw = '[!ABSTRACT]', rendered = rendered_callout.abstract, highlight = 'RenderMarkdownInfo' },
        todo = { raw = '[!TODO]', rendered = rendered_callout.todo, highlight = 'RenderMarkdownInfo' },
        success = { raw = '[!SUCCESS]', rendered = rendered_callout.success, highlight = 'RenderMarkdownSuccess' },
        question = { raw = '[!QUESTION]', rendered = rendered_callout.question, highlight = 'RenderMarkdownWarn' },
        failure = { raw = '[!FAILURE]', rendered = rendered_callout.failure, highlight = 'RenderMarkdownError' },
        danger = { raw = '[!DANGER]', rendered = rendered_callout.danger, highlight = 'RenderMarkdownError' },
        bug = { raw = '[!BUG]', rendered = rendered_callout.bug, highlight = 'RenderMarkdownError' },
        example = { raw = '[!EXAMPLE]', rendered = rendered_callout.example, highlight = 'RenderMarkdownHint' },
        quote = { raw = '[!QUOTE]', rendered = rendered_callout.quote, highlight = 'RenderMarkdownQuote' },
      },
      link = {
        -- Turn on / off inline link icon rendering
        enabled = true,
        -- Inlined with 'image' elements
        image = '󰥶 ',
        -- Inlined with 'inline_link' elements
        hyperlink = '󰌹 ',
        -- Applies to the inlined icon
        highlight = 'RenderMarkdownLink',
      },
      sign = {
        -- Turn on / off sign rendering
        enabled = true,
        -- More granular mechanism, disable signs within specific buftypes
        exclude = {
          buftypes = { 'nofile' },
        },
        -- Applies to background of sign text
        highlight = 'RenderMarkdownSign',
      },
      -- Window options to use that change between rendered and raw view
      win_options = {
        -- See :h 'conceallevel'
        conceallevel = {
          -- Used when not being rendered, get user setting
          default = vim.api.nvim_get_option_value('conceallevel', {}),
          -- Used when being rendered, concealed text is completely hidden
          rendered = 3,
        },
        -- See :h 'concealcursor'
        concealcursor = {
          -- Used when not being rendered, get user setting
          default = vim.api.nvim_get_option_value('concealcursor', {}),
          -- Used when being rendered, disable concealing text in all modes
          rendered = '',
        },
      },
      -- Mapping from treesitter language to user defined handlers
      -- See 'Custom Handlers' document for more info
      custom_handlers = {},
    },
    name = 'render-markdown',                                                      -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
}
