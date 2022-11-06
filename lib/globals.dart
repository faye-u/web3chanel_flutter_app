library globals;
import 'package:walletconnect_dart/walletconnect_dart.dart';

bool isLoggedIn = false;
var connector = WalletConnect(
    bridge: 'https://bridge.walletconnect.org',
    clientMeta: const PeerMeta(
      name: 'My App',
      description: 'An dapp for socialFi NFT',
      url: 'https://walletconnect.org',
      icons: [
        'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
  ]));
var provider = EthereumWalletConnectProvider(connector);
