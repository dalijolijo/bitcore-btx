import { IValidation } from '..';
const BitcoreBtx = require('bitcore-lib-btx');

export class BtxValidation implements IValidation {
  validateAddress(network: string, address: string): boolean {
    const AddressBtx = BitcoreBtx.Address;
    // Regular Address: try Bitcoin Cash
    return AddressBtx.isValid(address, network);
  }

  validateUri(addressUri: string): boolean {
    // Check if the input is a valid uri or address
    const URIBtx = BitcoreBtx.URI;
    // Bip21 uri
    return URIBtx.isValid(addressUri);
  }
}
