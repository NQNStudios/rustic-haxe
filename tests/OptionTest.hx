package tests;

import haxe.ds.Option;
using rustic.Option;

import utest.Assert;

class OptionTest extends utest.Test {
  function testUnwrap() {
    var opt = Some(1);

    Assert.equals(opt.unwrap(), 1);
  }

}