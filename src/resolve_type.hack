/*
 *  Copyright (c) 2017-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the MIT license found in the
 *  LICENSE file in the root directory of this source tree.
 *
 */

namespace Facebook\HHAST;

use namespace HH\Lib\C;
use namespace Facebook\HHAST\__Private\Resolution;

function resolve_type(string $type, Script $root, Node $node): string {
  $uses = Resolution\get_current_uses($root, $node);

  if (C\contains_key($uses['types'], $type)) {
    return $uses['types'][$type];
  }

  return Resolution\resolve_name($type, $root, $node, $uses['namespaces']);
}
