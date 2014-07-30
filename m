Content-Type: multipart/mixed; boundary="===============9077817148796302373=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [delayed_fput] BUG: unable to handle kernel paging request at ffff8800122a0ad0
Date: Wed, 30 Jul 2014 20:47:50 +0800
Message-ID: <20140730124750.GB7717@localhost>
In-Reply-To: <20140730111521.GB759@infradead.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============9077817148796302373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2014 at 04:15:21AM -0700, Christoph Hellwig wrote:
> On Wed, Jul 30, 2014 at 11:55:41AM +0800, Fengguang Wu wrote:
> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> =

> How does this manage to trip over a 2 year old commit now?

The bug is first discovered in linux-next, then the older kernel
releases (v3.15, v3.14, ...) are tested step by step, until it's found
to be introduced between v3.5 and v3.6. Then bisect can be started:

git bisect start v3.6 v3.5 --

Thanks,
Fengguang

--===============9077817148796302373==--

