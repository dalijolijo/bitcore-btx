import { BaseModule } from '..';
import { BTXStateProvider } from '../../providers/chain-state/btx/btx';
import { BitcoinP2PWorker } from '../bitcoin/p2p';
import { VerificationPeer } from '../bitcoin/VerificationPeer';

export default class BTXModule extends BaseModule {
  constructor(services) {
    super(services);
    services.Libs.register('BTX', 'bitcore-lib-btx', 'bitcore-p2p-btx');
    services.P2P.register('BTX', BitcoinP2PWorker);
    services.CSP.registerService('BTX', new BTXStateProvider());
    services.Verification.register('BTX', VerificationPeer);
  }
}
