'use strict';

const { utils } = require('surgio');

/**
 * 使用文档：https://surgio.js.org/
 */
module.exports = {
  remoteSnippets: [
  ],
  customFilters: {
    // hktFilter: utils.useKeywords(['hkt', 'HKT']),
  },
  artifacts: [
    {
      name: 'dler_gamer.conf',
      template: 'surge',
      provider: 'dler_gamer',
    },
    {
      name: 'dler.conf',
      template: 'surge',
      provider: 'dler',
    }
  ],
  surgeConfig: {
    resolveHostname: false,
  },
  analytics: false,
};
