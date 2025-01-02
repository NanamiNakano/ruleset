const { defineClashProvider } = require('surgio');
require('dotenv').config()

module.exports = defineClashProvider({
  url: process.env.DLER,
  // ...
});
