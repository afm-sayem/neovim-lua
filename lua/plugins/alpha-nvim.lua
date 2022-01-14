-----------------------------------------------------------
-- Dashboard configuration file
-----------------------------------------------------------

-- Plugin: alpha-nvim
-- https://github.com/goolord/alpha-nvim


local alpha = require 'alpha'
local startify = require 'alpha.themes.startify'

require('alpha').setup(startify.opts)
