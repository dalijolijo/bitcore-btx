const BitcoreLibMec = require('bitcore-lib-mec');
import { AbstractBitcoreLibDeriver } from '../btc';
export class MecDeriver extends AbstractBitcoreLibDeriver {
  bitcoreLib = BitcoreLibMec;
}
