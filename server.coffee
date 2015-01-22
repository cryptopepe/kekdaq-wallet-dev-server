fs = require('fs')
stat = require('node-static')
url = require('url')
httpProxy = require('http-proxy')

walletPath = process.env.WALLET_PATH
dogeblockdUrl = process.env.DOGEBLOCKD_URL
port = 8080


if fs.existsSync(walletPath)
  console.log "Serving wallet from '#{walletPath}'."
  console.log "Connecting to Dogeblockd at '#{dogeblockdUrl}'."

  fileServer = new stat.Server(walletPath)
  proxy = httpProxy.createProxyServer()

  require('http').createServer((req, res) ->
    console.log "'#{req.url}'"
    if req.url == '/servers.json'
      res.write JSON.stringify(servers: [])
      #servers: [dogeblockdUrl])
      res.end()
    else if req.url.match(/^\/_api/)
      # req.url = req.url.replace(/^\/_api/, '/api')
      req.url = req.url.replace(/^\/_api/, '')
      console.log "proxying to '#{dogeblockdUrl}#{req.url}'"
      proxy.web req, res, target: dogeblockdUrl
    else
      req.addListener('end', ->
        fileServer.serve(req, res)
      ).resume()
  ).listen(port)
  console.log "Listening at http://0.0.0.0:#{port}"
else
  console.log "Wallet path not found '#{walletPath}', set via WALLET_PATH."
  process.exit 1

