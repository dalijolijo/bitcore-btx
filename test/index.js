'use strict';

var should = require('chai').should();
var btxcore = require('../');

describe('Library', function() {
  it('should export primatives', function() {
    should.exist(btxcore.crypto);
    should.exist(btxcore.encoding);
    should.exist(btxcore.util);
    should.exist(btxcore.errors);
    should.exist(btxcore.Address);
    should.exist(btxcore.Block);
    should.exist(btxcore.MerkleBlock);
    should.exist(btxcore.BlockHeader);
    should.exist(btxcore.HDPrivateKey);
    should.exist(btxcore.HDPublicKey);
    should.exist(btxcore.Networks);
    should.exist(btxcore.Opcode);
    should.exist(btxcore.PrivateKey);
    should.exist(btxcore.PublicKey);
    should.exist(btxcore.Script);
    should.exist(btxcore.Transaction);
    should.exist(btxcore.URI);
    should.exist(btxcore.Unit);
  });
});
