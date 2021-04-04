# API Documentation for MEC

## Transactions

### Get Transactions by blockHeight

GET `/api/MEC/mainnet/tx?blockHeight=12`

<details>
<summary>
<b>Response</b>
</summary>
<br>
<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/tx?blockHeight=12
```

```json
[
   {
      "blockHash" : "14ef67800d6f37104b93c08dbb724fc8e74ebb0985d7e03e724a72a09cde7b2e",
      "blockHeight" : 12,
      "outputCount" : 2,
      "txid" : "47d32c2a2868f71a3897b48c57e367f530904b75a65badd8d77a95c1ad7ff096",
      "locktime" : -1,
      "coinbase" : true,
      "network" : "mainnet",
      "blockTime" : "2017-04-24T04:09:31.000Z",
      "chain" : "MEC",
      "confirmations" : 575847,
      "inputCount" : 1,
      "fee" : -1,
      "blockTimeNormalized" : "2017-04-24T04:09:31.000Z",
      "_id" : "5e8606816061cb14b33fc628",
      "value" : 1250000000,
      "size" : 145
   }
]
```

</details>

### Get Transactions by blockHash

GET `/api/MEC/mainnet/tx?blockHash=000000006a625f06636b8bb6ac7b960a8d03705d1ace08b1a19da3fdcc99ddbd`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/tx?blockHash=e12a0c31e904f7747fb0f66042ffa418ddda737ff95833ea89092a58d52866e4
```

```json
[
   {
      "value" : 312500000,
      "coinbase" : true,
      "size" : 115,
      "blockHeight" : 580395,
      "confirmations" : -4536,
      "chain" : "MEC",
      "fee" : -1,
      "blockHash" : "e12a0c31e904f7747fb0f66042ffa418ddda737ff95833ea89092a58d52866e4",
      "_id" : "5e9595ca5005e30c78f76378",
      "inputCount" : 1,
      "locktime" : -1,
      "blockTime" : "2020-04-14T11:04:01.000Z",
      "network" : "mainnet",
      "txid" : "172eaed7602a511a9d36a5173d4b17675ff92cd50a2c3c6ce5ae4bd92e08cf12",
      "blockTimeNormalized" : "2020-04-14T11:04:01.000Z",
      "outputCount" : 1
   }
]
```

</details>

### Get Transaction by txid

GET `/api/MEC/mainnet/tx/:txid`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/tx/172eaed7602a511a9d36a5173d4b17675ff92cd50a2c3c6ce5ae4bd92e08cf12
```

```json
{
   "fee" : -1,
   "blockTimeNormalized" : "2020-04-14T11:04:01.000Z",
   "txid" : "172eaed7602a511a9d36a5173d4b17675ff92cd50a2c3c6ce5ae4bd92e08cf12",
   "locktime" : -1,
   "network" : "mainnet",
   "size" : 115,
   "chain" : "MEC",
   "confirmations" : -4536,
   "value" : 312500000,
   "outputCount" : 1,
   "blockHash" : "e12a0c31e904f7747fb0f66042ffa418ddda737ff95833ea89092a58d52866e4",
   "blockHeight" : 580395,
   "coinbase" : true,
   "inputCount" : 1,
   "_id" : "5e9595ca5005e30c78f76378",
   "blockTime" : "2020-04-14T11:04:01.000Z"
}
```

</details>

### Get Authhead

GET `/MEC/mainnet/tx/:txid/authhead`

<details>
<summary>
<b>Response</b>
</summary>
<br>
<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/tx/172eaed7602a511a9d36a5173d4b17675ff92cd50a2c3c6ce5ae4bd92e08cf12/authhead
```

```json
{
   "identityOutputs" : [],
   "network" : "mainnet",
   "chain" : "MEC",
   "authbase" : "172eaed7602a511a9d36a5173d4b17675ff92cd50a2c3c6ce5ae4bd92e08cf12"
}
```

</details>

### Get Coins

GET `/MEC/mainnet/tx/:txid/coins`

<details>
<summary>
<b>Response</b>
</summary>
<br>
<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/tx/172eaed7602a511a9d36a5173d4b17675ff92cd50a2c3c6ce5ae4bd92e08cf12/coins
```

```json
{
   "outputs" : [
      {
         "mintHeight" : 580395,
         "spentHeight" : -2,
         "value" : 312500000,
         "coinbase" : true,
         "address" : "2EuXKCjoXzCTb6aUvAArkodfrPrp2iZ4AD",
         "_id" : "5e9595ca5005e30c78f76375",
         "spentTxid" : "",
         "script" : "76a91414bfdd8941fe95b3d033ad669b9968d731478f8488ac",
         "confirmations" : -1,
         "mintTxid" : "172eaed7602a511a9d36a5173d4b17675ff92cd50a2c3c6ce5ae4bd92e08cf12",
         "mintIndex" : 0,
         "network" : "mainnet",
         "chain" : "MEC"
      }
   ],
   "inputs" : []
}
```

</details>

## Address

### Get Address Transactions

GET `/api/MEC/mainnet/address/:address/txs`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/address/2RfbGtSeULJez9UjGsJcWPsfyHTUZiTnPg/txs
```

```json
[
   {
      "network" : "mainnet",
      "chain" : "MEC",
      "mintIndex" : 0,
      "mintHeight" : 580319,
      "_id" : "5e95682c5005e30c78dc566f",
      "confirmations" : -1,
      "value" : 1000000,
      "coinbase" : false,
      "address" : "2RfbGtSeULJez9UjGsJcWPsfyHTUZiTnPg",
      "script" : "76a9148ac6bb327e87568f16d75a041a4f7926393667ae88ac",
      "mintTxid" : "fca422115dfc5693059ec8be06bd0db55ddafee549e68cae6db4f2fb6a1c2dd8",
      "spentHeight" : -2,
      "spentTxid" : ""
   }
]
```

</details>

### Get Transaction Outputs by Address

GET `/api/MEC/mainnet/address/:address/?unspent=true`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/address/2RfbGtSeULJez9UjGsJcWPsfyHTUZiTnPg/?unspent=true
```

```json
[
   {
      "mintHeight" : 580319,
      "coinbase" : false,
      "mintIndex" : 0,
      "value" : 1000000,
      "spentTxid" : "",
      "mintTxid" : "fca422115dfc5693059ec8be06bd0db55ddafee549e68cae6db4f2fb6a1c2dd8",
      "chain" : "MEC",
      "script" : "76a9148ac6bb327e87568f16d75a041a4f7926393667ae88ac",
      "address" : "2RfbGtSeULJez9UjGsJcWPsfyHTUZiTnPg",
      "_id" : "5e95682c5005e30c78dc566f",
      "confirmations" : -1,
      "spentHeight" : -2,
      "network" : "mainnet"
   }
]
```

</details>

### Get Balance for an Address

GET `/api/MEC/mainnet/address/:address/balance`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/address/2RfbGtSeULJez9UjGsJcWPsfyHTUZiTnPg/balance
```

```json
{
   "balance" : 1000000,
   "unconfirmed" : 0,
   "confirmed" : 1000000
}
```

</details>

## Block

### Get Block

GET `/api/MEC/mainnet/block/:blockId`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/block/d95660b39e3bca7aa5159f32d484629b649796ec9ab882cc91f853a8fb238c55
```

```json
{
   "network" : "mainnet",
   "version" : 536870912,
   "reward" : 312582721,
   "time" : "2020-04-14T08:35:06.000Z",
   "height" : 580331,
   "timeNormalized" : "2020-04-14T08:35:06.000Z",
   "hash" : "d95660b39e3bca7aa5159f32d484629b649796ec9ab882cc91f853a8fb238c55",
   "confirmations" : -4472,
   "transactionCount" : 3,
   "nonce" : 661668582,
   "size" : 562,
   "chain" : "MEC",
   "merkleRoot" : "003f848c56d74a1268a20d09b5af47d04d6395491993d854d4ea243ae3b608ce",
   "bits" : 453814285,
   "_id" : "5e9572b95005e30c78e29972",
   "nextBlockHash" : "4fdefca9a3ac5202b3d1484aba2f45ad6ce9e62d47d0332b70ad3d41122300eb",
   "previousBlockHash" : "ecdf13b89ac5df31706b8645fe3d72dd6a000df99ed3e67c02cda1a4e8aff922"
}
```

</details>

### Get Current Height

GET `/api/MEC/mainnet/block/tip`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/block/tip
```

```json
{
   "time" : "2020-04-06T12:39:24.000Z",
   "nonce" : 605478260,
   "transactionCount" : 1,
   "chain" : "MEC",
   "previousBlockHash" : "ecaeed84256e48f07bc87e152312e1724f282bd97179664495bfa622f2e1e6ec",
   "nextBlockHash" : "",
   "size" : 196,
   "version" : 536870912,
   "network" : "mainnet",
   "merkleRoot" : "1b77bfbbbcae34c62c7c0cf49cffbe84c1fa0529f174640b7071bbbf616cf71c",
   "timeNormalized" : "2020-04-06T12:39:24.000Z",
   "reward" : 312500000,
   "_id" : "5e8b202c5005e30c78afb658",
   "bits" : 453970766,
   "processed" : true,
   "hash" : "d188dafee200131230ab2e49f3c5f17f3af3c7b4516dee8992efee9ec6d2394a",
   "height" : 575858
}
```

</details>

## Authenticated Methods

### Wallet

**To test wallet api routes change allowUnauthenticatedCalls: true inside bitcore.config.json**

```json
"bitcoreNode": {
    "services": {
        "api": {
            "wallets": {
                "allowCreationBeforeCompleteSync": true
            }
        }
    },
    ...
}
```

**Create 5 Sample Wallets with transactions, addresses, and UTXOS**

Inside the project root directory /bitcore/ run:

```sh
node packages/bitcore-node/build/test/benchmark/wallet-benchmark.js
```

### Add Wallet TODO : Update for MEC needed

POST `/api/MEC/mainnet/wallet`

BODY:

```json
{
    "name": "WalletName2",
    "chain": "MEC",
    "network": "mainnet",
    "pubKey": "03bdb94afdc7e5c4811bf9b160ac475b82156ea42c8659c8358b68c828df9a1c3d",
    "path": "m/44'/160'/0'"
}
```

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl -v POST -H "Content-Type: application/json" -d '{
  "name": "WalletName2",
  "chain": "MEC",
  "network": "mainnet",
  "pubKey": "03bdb94afdc7e5c4811bf9b160ac475b82156ea42c8659c8358b68c828df9a1c3d",
  "path": "m/44'/160'/0'"
}' "https://api.bitcore.cc/api/MEC/mainnet/wallet/"
```

```json
{
    "chain": "BTC",
    "network": "mainnet",
    "name": "WalletName2",
    "pubKey": "03bdb94afdc7e5c4811bf9b160ac475b82156ea42c8659c8358b68c828df9a1c3d",
    "path": "m/44'/160'/0'",
    "_id": "5c3631e538704e27c6f146c3"
}
```

</details>

### Get Wallet TODO : Update for MEC needed

GET `/api/MEC/mainnet/wallet/:pubKey`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/wallet/03bdb94afdc7e5c4811bf9b160ac475b82156ea42c8659c8358b68c828df9a1c3d
```

```json
{
    "_id": "5c3639d1e60f7b2e174afc65",
    "chain": "BTC",
    "network": "mainnet",
    "name": "WalletName",
    "pubKey": "03bdb94afdc7e5c4811bf9b160ac475b82156ea42c8659c8358b68c828df9a1c3d",
    "path": "m/44'/0'/0'",
    "singleAddress": null
}
```

</details>

### Import Addresses TODO : Update for MEC needed

POST `/api/MEC/mainnet/wallet/:pubKey`

BODY: raw jsonl wallet file of the form

```json
{
    "address": "mmEsgUprBEQkGDKowPQSLEYDbMtGRKxaF4"
}
```

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/wallet/03bdb94afdc7e5c4811bf9b160ac475b82156ea42c8659c8358b68c828df9a1c3d
```

```json
{
    "_id": "5c3639d1e60f7b2e174afc65",
    "chain": "BTC",
    "network": "mainnet",
    "name": "WalletName",
    "pubKey": "03bdb94afdc7e5c4811bf9b160ac475b82156ea42c8659c8358b68c828df9a1c3d",
    "path": "m/44'/0'/0'",
    "singleAddress": null
}
```

</details>

### Get Wallet Addresses TODO : Update for MEC needed

GET `/api/MEC/mainnet/wallet/:pubKey/addresses`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/wallet/03bdb94afdc7e5c4811bf9b160ac475b82156ea42c8659c8358b68c828df9a1c3d/addresses
```

```json
[
    {
        "address": "12c6DSiU4Rq3P4ZxziKxzrL5LmMBrzjrJX"
    },
    {
        "address": "1HLoD9E4SDFFPDiYfNYnkBLQ85Y51J3Zb1"
    },
    {
        "address": "1FvzCLoTPGANNjWoUo6jUGuAG3wg1w4YjR"
    }
]
```

</details>

### Get Wallet Transactions TODO : Update for MEC needed

GET `/api/MEC/mainnet/wallet/:pubKey/transactions`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/wallet/02870d8366cf8e50f383e38e5fafc01d956b67f25fbf5c1dd4e3766cf85acbc400/transactions
```

```json
[
    {
        "id":"5c34b35d69d5562c2fc43e8c",
        "txid":"0e3e2357e806b6cdb1f70b54c3a3a17b6714ee1f0e68bebb44a74b1efd512098",
        "fee":0,"size":134,
        "category":"receive",
        "satoshis":5000000000,
        "height":1,
        "address":"12c6DSiU4Rq3P4ZxziKxzrL5LmMBrzjrJX",
        "outputIndex":0,
        "blockTime":"2009-01-09T02:54:25.000Z"
    }
]
```

</details>

### Get Balance TODO : Update for MEC needed

GET `/api/MEC/mainnet/wallet/:pubKey/balance`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/wallet/02870d8366cf8e50f383e38e5fafc01d956b67f25fbf5c1dd4e3766cf85acbc400/balance
```

```json
{
    "confirmed": 46800000000,
    "unconfirmed": 0,
    "balance": 46800000000
}
```

</details>

### Get Wallet UTXOS TODO : Update for MEC needed

GET `/api/MEC/mainnet/wallet/:pubKey/utxos`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/wallet/02870d8366cf8e50f383e38e5fafc01d956b67f25fbf5c1dd4e3766cf85acbc400/utxos
```

```json
[
    {
        "_id": "5c34b36069d5562c2fc45b09",
        "chain": "BTC",
        "network": "mainnet",
        "coinbase": false,
        "mintIndex": 1,
        "spentTxid": "",
        "mintTxid": "828ef3b079f9c23829c56fe86e85b4a69d9e06e5b54ea597eef5fb3ffef509fe",
        "mintHeight": 248,
        "spentHeight": -2,
        "address": "12cbQLTFMXRnSzktFkuoG3eHoMeFtpTu3S",
        "script": "410411db93e1dcdb8a016b49840f8c53bc1eb68a382e97b1482ecad7b148a6909a5cb2e0eaddfb84ccf9744464f82e160bfa9b8b64f9d4c03f999b8643f656b412a3ac",
        "value": 1800000000,
        "confirmations": 103006
    }
]
```

</details>

### Get Wallet UTXOS TODO : Update for MEC needed

GET `/api/MEC/mainnet/wallet/:pubKey/utxos`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/wallet/02870d8366cf8e50f383e38e5fafc01d956b67f25fbf5c1dd4e3766cf85acbc400/addresses/missing
```

```json
[
    {
        "_id": "5c34b36069d5562c2fc45b09",
        "chain": "BTC",
        "network": "mainnet",
        "coinbase": false,
        "mintIndex": 1,
        "spentTxid": "",
        "mintTxid": "828ef3b079f9c23829c56fe86e85b4a69d9e06e5b54ea597eef5fb3ffef509fe",
        "mintHeight": 248,
        "spentHeight": -2,
        "address": "12cbQLTFMXRnSzktFkuoG3eHoMeFtpTu3S",
        "script": "410411db93e1dcdb8a016b49840f8c53bc1eb68a382e97b1482ecad7b148a6909a5cb2e0eaddfb84ccf9744464f82e160bfa9b8b64f9d4c03f999b8643f656b412a3ac",
        "value": 1800000000,
        "confirmations": 103006
    }
]
```

</details>

## Fee TODO : RPC Error

### Get Fee estimate for within N blocks

GET `/api/MEC/mainnet/fee/:target`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/fee/22
```

```json
{
    "blocks": "22",
    "feerate": "0.00002003"
}
```

</details>

## Stats

### Get Daily Transactions

GET `/api/MEC/mainnet/stats/daily-transactions`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/MEC/mainnet/stats/daily-transactions
```

```json
{
   "results" : [
      {
         "transactionCount" : 648,
         "date" : "2020-03-15"
      },
      {
         "transactionCount" : 627,
         "date" : "2020-03-16"
      },
      {
         "transactionCount" : 608,
         "date" : "2020-03-17"
      },
      {
         "transactionCount" : 641,
         "date" : "2020-03-18"
      },
      {
         "date" : "2020-03-19",
         "transactionCount" : 677
      },
      {
         "transactionCount" : 620,
         "date" : "2020-03-20"
      },
      {
         "transactionCount" : 625,
         "date" : "2020-03-21"
      },
      {
         "date" : "2020-03-22",
         "transactionCount" : 655
      },
      {
         "transactionCount" : 613,
         "date" : "2020-03-23"
      },
      {
         "date" : "2020-03-24",
         "transactionCount" : 665
      },
      {
         "date" : "2020-03-25",
         "transactionCount" : 663
      },
      {
         "date" : "2020-03-26",
         "transactionCount" : 591
      },
      {
         "transactionCount" : 665,
         "date" : "2020-03-27"
      },
      {
         "date" : "2020-03-28",
         "transactionCount" : 641
      },
      {
         "transactionCount" : 635,
         "date" : "2020-03-29"
      },
      {
         "transactionCount" : 635,
         "date" : "2020-03-30"
      },
      {
         "transactionCount" : 588,
         "date" : "2020-03-31"
      },
      {
         "transactionCount" : 644,
         "date" : "2020-04-01"
      },
      {
         "date" : "2020-04-02",
         "transactionCount" : 646
      },
      {
         "date" : "2020-04-03",
         "transactionCount" : 655
      },
      {
         "date" : "2020-04-04",
         "transactionCount" : 580
      },
      {
         "transactionCount" : 721,
         "date" : "2020-04-05"
      },
      {
         "transactionCount" : 720,
         "date" : "2020-04-06"
      },
      {
         "transactionCount" : 730,
         "date" : "2020-04-07"
      },
      {
         "transactionCount" : 676,
         "date" : "2020-04-08"
      },
      {
         "transactionCount" : 654,
         "date" : "2020-04-09"
      },
      {
         "date" : "2020-04-10",
         "transactionCount" : 737
      },
      {
         "transactionCount" : 594,
         "date" : "2020-04-11"
      },
      {
         "transactionCount" : 689,
         "date" : "2020-04-12"
      },
      {
         "date" : "2020-04-13",
         "transactionCount" : 662
      }
   ],
   "network" : "mainnet",
   "chain" : "MEC"
}
```

</details>

## Status

### Get Enabled Chains

GET `/api/status/enabled-chains`

<details>
<summary><b>Response</b></summary>
<br>

<b>Use Curl command in terminal to get a response</b>

```sh
curl https://api.bitcore.cc/api/status/enabled-chains
```

```json
[
   {
      "network" : "mainnet",
      "chain" : "MEC"
   }
]
```

</details>
