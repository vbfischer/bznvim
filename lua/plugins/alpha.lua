local present, alpha = pcall(require, "alpha")
if not present then
  return
end

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


alpha.setup(dashboard.opts)
