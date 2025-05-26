vim.keymap.set('v', 'p', '"_dP', { desc = 'Paste without yanking replaced text' })

vim.keymap.set({ "n", "x", "i" }, "<C-d>", function()
  vscode.with_insert(function()
    vscode.action("editor.action.addSelectionToNextFindMatch")
  end)
end)

