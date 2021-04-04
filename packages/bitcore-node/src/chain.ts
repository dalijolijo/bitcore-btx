module.exports = {
  BTC: {
    lib: require('bitcore-lib'),
    p2p: require('bitcore-p2p'),
  },
  BCH: {
    lib: require('bitcore-lib-cash'),
    p2p: require('bitcore-p2p-cash'),
  },
  MEC: {
    lib: require('bitcore-lib-mec'),
    p2p: require('bitcore-p2p-mec'),
  },
}
