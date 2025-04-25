require("core.options");
require("core.keymaps");
require("core.lazy");

function SetupColors(input)
    input = input or "min-theme"
    vim.cmd("colorscheme " .. input);

    vim.cmd([[
      highlight Normal guibg=#000000 ctermbg=0
      highlight NormalNC guibg=#000000 ctermbg=0
      highlight LineNr guibg=#000000 ctermbg=0
      highlight SignColumn guibg=#000000 ctermbg=0
      highlight VertSplit guibg=#000000 ctermbg=0
    ]])
end

SetupColors()
