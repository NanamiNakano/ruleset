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
  gateway: {
    auth: true,
    accessToken: 'SueDUNINGERNEmOB',
    viewerToken: 'swakeRNBlEaUtAcH',
  },
  urlBase: 'https://surgio.thynanami.dev/',
  analytics: false,
  cache: process.env.REDIS_URL
  ? {
    type: 'redis',
    redisUrl: process.env.REDIS_URL,
  }
  : undefined,
};
