module.exports = {
  BTC: {
    lib: require('bitcore-lib'),
    p2p: require('bitcore-p2p')
  },
  BCH: {
    lib: require('bitcore-lib-cash'),
    p2p: require('bitcore-p2p-cash')
  },
  BTX: {
    lib: require('bitcore-lib-btx'),
    p2p: require('bitcore-p2p-btx')
  }
};
