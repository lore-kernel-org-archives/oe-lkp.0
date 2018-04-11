Content-Type: multipart/mixed; boundary="===============1708557422134044558=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [bisect done] e979e5a059 [ 13.554900] BUG: unable to handle kernel paging request at ffff88001d178010
Date: Wed, 11 Apr 2018 15:48:37 +0100
Message-ID: <11690.1523458117@warthog.procyon.org.uk>
In-Reply-To: <20180410010732.agv2agswmubthxdg@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1708557422134044558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This is due to mount not taking a size for the data, but some of the intern=
al
callers of mount in the kernel allocate a small buffer on the stack, which =
the
new patches try and copy, assuming it to be a whole page.

The patch that I've added into the series that passes the data size around
should fix this until it can all be replaced with the fs-context stuff.

David

--===============1708557422134044558==--

