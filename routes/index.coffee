shell = (require 'child_process')
fs = require 'fs'
#
# * GET home page.
# 
exports.index = (req, res) ->
  res.render "index"
	
exports.lint = (req, res) ->
	name = Math.floor((Math.random()*1000)+1) + '.cpp'
	fs.writeFile name, req.body.data, (error) ->
		if not error
			shell.exec 'python cpplint.py ' + name, (error, stdout, stderr) ->
				res.send arguments
				fs.unlink name, (error) ->
			
		else
			res.send '404'
	