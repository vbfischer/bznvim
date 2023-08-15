local dashboard = require("alpha.themes.dashboard")

local logo = [[

         ██    ██  ██████ ██████  ██      ██    ██ ███████
         ██    ██ ██      ██   ██ ██      ██    ██ ██
         ██    ██ ██      ██████  ██      ██    ██ ███████
          ██  ██  ██      ██      ██      ██    ██      ██
           ████    ██████ ██      ███████  ██████  ███████


                   ██     ██ ███████ ██████
                   ██     ██ ██      ██   ██
                   ██  █  ██ █████   ██████
                   ██ ███ ██ ██      ██   ██
                    ███ ███  ███████ ██████

                ]]

dashboard.section.header.val = vim.split(logo, "\n")
dashboard.section.header.opts.hl = "AlphaHeader"

require("alpha").setup(dashboard.opts)

