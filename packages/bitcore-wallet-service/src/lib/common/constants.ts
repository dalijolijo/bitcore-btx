'use strict';

module.exports = {
  COINS: {
    BTC: 'btc',
    BCH: 'bch',
    BTX: 'btx',
    ETH: 'eth',
    USDC: 'usdc',
    PAX: 'pax',
    GUSD: 'gusd'
  },

  ERC20: {
    USDC: 'usdc',
    PAX: 'pax',
    GUSD: 'gusd'
  },

  UTXO_COINS: {
    BTC: 'btc',
    BCH: 'bch',
    BTX: 'btx'
  },

  NETWORKS: {
    LIVENET: 'livenet',
    TESTNET: 'testnet'
  },

  ADDRESS_FORMATS: ['copay', 'cashaddr', 'legacy'],

  SCRIPT_TYPES: {
    P2SH: 'P2SH',
    P2PKH: 'P2PKH'
  },
  DERIVATION_STRATEGIES: {
    BIP44: 'BIP44',
    BIP45: 'BIP45'
  },

  PATHS: {
    SINGLE_ADDRESS: "m/0'/0",
    REQUEST_KEY: "m/1'/0",
    TXPROPOSAL_KEY: "m/1'/1",
    REQUEST_KEY_AUTH: 'm/2' // relative to BASE
  },

  BIP45_SHARED_INDEX: 0x80000000 - 1
};
