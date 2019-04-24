Content-Type: multipart/mixed; boundary="===============3391390725038515450=="
MIME-Version: 1.0
From: David Howells <dhowells@redhat.com>
To: lkp@lists.01.org
Subject: Re: c81b289acb ("keys: Network namespace domain tag"): WARNING: CPU: 0 PID: 53 at lib/refcount.c:190 refcount_sub_and_test_checked
Date: Wed, 24 Apr 2019 22:47:23 +0100
Message-ID: <706.1556142443@warthog.procyon.org.uk>
In-Reply-To: <5cc0be6b.UKvnuj6zAOc9ywai%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3391390725038515450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This can be reproduced with:

unshare -n
echo -ne "1.2.3.4\0" | keyctl padd dns_resolver foo.bar @s
logout

There was a missing initialisation of the refcount on a new tag.

David

--===============3391390725038515450==--

