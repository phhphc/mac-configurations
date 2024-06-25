return {
  "sindrets/diffview.nvim",
  opts = function(_, opts)
    local actions = require "diffview.actions"
    opts.file_panel = {
      win_config = function()
        local c = { type = "float" }
        local editor_width = vim.o.columns
        local editor_height = vim.o.lines
        c.width = math.min(100, editor_width)
        c.height = math.min(24, editor_height)
        c.col = math.floor(editor_width * 0.5 - c.width * 0.5)
        c.row = math.floor(editor_height * 0.5 - c.height * 0.5)
        return c
      end,
    }

    local function file_panel_select_entry()
      actions.select_entry()
      local view = require("diffview.lib").get_current_view()
      if view == nil then return end
      ---@diagnostic disable-next-line: undefined-field
      local panel = view.panel
      if panel:is_open() then
        local item = panel:get_item_at_cursor()
        if item and type(item.collapsed) ~= "boolean" then panel:close() end
      end
    end
    opts.keymaps = {
      view = {
        { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel." } },
      },
      file_panel = {
        { "n", "<leader>e", actions.toggle_files, { desc = "Toggle the file panel." } },
        { "n", "<cr>", file_panel_select_entry, { desc = "Open the diff for the selected entry" } },
        { "n", "o", file_panel_select_entry, { desc = "Open the diff for the selected entry" } },
        { "n", "l", file_panel_select_entry, { desc = "Open the diff for the selected entry" } },
        {
          "n",
          "<2-LeftMouse>",
          file_panel_select_entry,
          { desc = "Open the diff for the selected entry" },
        },
      },
    }
  end,
}
