Content-Type: multipart/mixed; boundary="===============9112597556575353405=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 0/4] improve fault-tolerance of rhashtable runtime-test
Date: Mon, 23 Nov 2015 12:38:21 -0500
Message-ID: <20151123.123821.1971816203199981831.davem@davemloft.net>
In-Reply-To: <1448039840-11367-1-git-send-email-phil@nwl.cc>
List-Id: <oe-lkp.lists.linux.dev>

--===============9112597556575353405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Phil Sutter <phil@nwl.cc>
Date: Fri, 20 Nov 2015 18:17:16 +0100

> The following series aims to improve lib/test_rhashtable in different
> situations:
> =

> Patch 1 allows the kernel to reschedule so the test does not block too
>         long on slow systems.
> Patch 2 fixes behaviour under pressure, retrying inserts in non-permanent
>         error case (-EBUSY).
> Patch 3 auto-adjusts the upper table size limit according to the number
>         of threads (in concurrency test). In fact, the current default is
> 	already too small.
> Patch 4 makes it possible to retry inserts even in supposedly permanent
>         error case (-ENOMEM) to expose rhashtable's remaining problem of
> 	-ENOMEM being not as permanent as it is expected to be.
> =

> Changes since v1:
> - Introduce insert_retry() which is then used in single-threaded test as
>   well.
> - Do not retry inserts by default if -ENOMEM was returned.
> - Rename the retry counter to be a bit more verbose about what it
>   contains.
> - Add patch 4 as a debugging aid.

Series applied, thanks Phil.

--===============9112597556575353405==--

