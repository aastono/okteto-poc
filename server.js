const express = require('express');
const path = require('path');
const app = express();
const log = require('llog');

const port = 1234;

app.use(express.static(path.join(__dirname, 'build')));

app.get('/', function (req, res) {
  res.sendFile(path.join(__dirname, 'build', 'index.html'));
});

app.listen(port, () => {
  log.info(`Listening on port ${port}...`);
});