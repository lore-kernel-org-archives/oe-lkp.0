Content-Type: multipart/mixed; boundary="===============3157973405659946134=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [Btrfs] 3a8b36f3780: -62.6% fileio.requests_per_sec
Date: Tue, 31 Mar 2015 16:32:47 +0800
Message-ID: <1427790767.17170.95.camel@intel.com>
In-Reply-To: <55094E06.2070004@suse.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3157973405659946134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Filipe,

On Wed, 2015-03-18 at 10:05 +0000, Filipe Manana wrote:
[snip]

> Hi, thanks for this.
> =

> However this doesn't make sense to me.
> This commit only touches btrfs' fsync handler and the test uses sysbench
> without passing --file-fsync-freq to it, which means sysbench will never
> do fsyncs according to its man page (default for fsync frequency is 0).
> =

> Or maybe I missed something?

Sorry for late.

I checked source code of sysbench and found that the actual default
value of --file-fsync-freq is 100 instead of 0 in man page, as in the
following lines.

  {"file-fsync-freq", "do fsync() after this number of requests (0 - don't =
use fsync())",
   SB_ARG_TYPE_INT, "100"},

I double checked that via a debug patch to sysbench too.

Best Regards,
Huang, Ying



--===============3157973405659946134==--

