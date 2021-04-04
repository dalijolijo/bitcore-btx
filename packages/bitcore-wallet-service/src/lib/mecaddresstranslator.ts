import _ from 'lodash';
const Bitcore_ = {
  btc: require('bitcore-lib'),
  bch: require('bitcore-lib-mec')
};

export class MECAddressTranslator {
  static getAddressCoin(address) {
    try {
      new Bitcore_['btc'].Address(address);
      return 'legacy';
    } catch (e) {
      try {
        const a = new Bitcore_['mec'].Address(address);
        if (a.toLegacyAddress() == address) return 'copay';
        return 'cashaddr';
      } catch (e) {
        return;
      }
    }
  }

  // Supports 3 formats:  legacy (1xxx, mxxxx); Copay: (Cxxx, Hxxx), Cashaddr(qxxx);
  static translate(addresses, to, from?) {
    let wasArray = true;
    if (!_.isArray(addresses)) {
      wasArray = false;
      addresses = [addresses];
    }
    from = from || MECAddressTranslator.getAddressCoin(addresses[0]);

    let ret;
    if (from == to) {
      ret = addresses;
    } else {
      ret = _.filter(
        _.map(addresses, (x) => {
          const bitcore = Bitcore_[from == 'legacy' ? 'btc' : 'mec'];
          let orig;

          try {
            orig = new bitcore.Address(x).toObject();
          } catch (e) {
            return null;
          }

          if (to == 'cashaddr') {
            return Bitcore_['bch'].Address.fromObject(orig).toCashAddress(true);
          } else if (to == 'copay') {
            return Bitcore_['mec'].Address.fromObject(orig).toLegacyAddress();
          } else if (to == 'legacy') {
            return Bitcore_['btc'].Address.fromObject(orig).toString();
          }
        })
      );
    }
    if (wasArray) return ret;
    else return ret[0];
  }
}

module.exports = MECAddressTranslator;
