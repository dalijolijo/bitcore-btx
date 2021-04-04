import { BitcoinP2PWorker } from '../bitcoin/p2p';
import { BaseModule } from '..';
import { MECStateProvider } from '../../providers/chain-state/mec/mec';
import { VerificationPeer } from '../bitcoin/VerificationPeer';

export default class MECModule extends BaseModule {
  constructor(services) {
    super(services);
    services.Libs.register('MEC', 'bitcore-lib-mec', 'bitcore-p2p-mec');
    services.P2P.register('MEC', BitcoinP2PWorker);
    services.CSP.registerService('MEC', new MECStateProvider());
    services.Verification.register('MEC', VerificationPeer);
  }
}
