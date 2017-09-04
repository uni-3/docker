let express = require('express')
let app = express()
let port = process.env.EXPRESS_PORT


app.get('/', (req, res) => {
  res.send('hello\n')
})

app.listen(port, () => {
  console.log('node server listing on port: ', port)
})
