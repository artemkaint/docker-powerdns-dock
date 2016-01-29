// Copyright (c) 2013 The SkyDNS Authors. All rights reserved.
// Use of this source code is governed by The MIT License (MIT) that can be
// found in the LICENSE file.

package response

import (
)

type ServerResource struct {
    TYPE        string
    ID          string
    URL         string
    DAEMON_TYPE string
    VERSION     string
    CONFIG_URL  string
    ZONES_URL   string
}