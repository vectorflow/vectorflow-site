const express = require('express')
const app = express()
app.use(express.static(__dirname)); // This is allow access to static ass
app.get('/', (req, res) => res.sendFile("./vectorflow.html", {root: __dirname}))

app.get('/embed', (req, res) => res.sendFile("./embed-example.html", {root: __dirname}))
app.get('/widget', (req, res) => res.sendFile("./widget-example.html", {root: __dirname}))
app.get('/json', (req, res) => res.json({"user":"sanjeev", "root": "directory"}))

app.get('/test', (req, res) => res.sendFile("./home.html", {root: __dirname}))
app.listen(3006, () => console.log('Example app listening on port 3006!'))
