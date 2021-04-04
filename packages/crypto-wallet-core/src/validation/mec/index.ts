import { IValidation } from '..';
const BitcoreMec = require('bitcore-lib-mec');

export class MecValidation implements IValidation {
  validateAddress(network: string, address: string): boolean {
    const AddressMec = BitcoreMec.Address;
    // Regular Address: try Bitcoin MEC
    return AddressMec.isValid(address, network);
  }

  validateUri(addressUri: string): boolean {
    // Check if the input is a valid uri or address
    const URIMec = BitcoreMec.URI;
    // Bip21 uri
    return URIMec.isValid(addressUri);
  }
}
