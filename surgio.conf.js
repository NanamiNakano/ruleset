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
    usFilter: nodeConfig => nodeConfig.nodeName.includes('🇺🇸'),
    hkFilter: nodeConfig => nodeConfig.nodeName.includes('🇭🇰'),
    jpFilter: nodeConfig => nodeConfig.nodeName.includes('🇯🇵'),
    sgFilter: nodeConfig => nodeConfig.nodeName.includes('🇸🇬'),
  },
  artifacts: [
    {
      name: 'dler_nanami.conf',
      template: 'surge',
      provider: 'dler',
    },
  ],
  surgeConfig: {
    resolveHostname: false,
  },
};
