Content-Type: multipart/mixed; boundary="===============0127473572941514430=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Mon, 24 Feb 2020 21:20:14 +0800
Message-ID: <20200224132014.GA63607@shbuild999.sh.intel.com>
In-Reply-To: <20200224021915.GC5061@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0127473572941514430==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 10:19:15AM +0800, Feng Tang wrote:
> > =

> > > No, it's not the biggest, I tried another machine 'Xeon Phi(TM) CPU 7=
295',
> > > which has 72C/288T, and the regression is not seen. This is the part
> > > confusing me :)
> > =

> > Hmm.
> > =

> > Humor me - what  happens if you turn off SMT on that Cascade Lake
> > system?  Maybe it's about the thread ID bit in the L1? Although again,
> > I'd have expected things to get _worse_ if it's the two fields that
> > are now in the same cachline thanks to alignment.
> =

> I'll try it and report back.

I added "nosmt=3Dforce" on the 2S 4 nodes 96C/192T machine, and tested
both 96 and 192 processes, and the regression still exists.

Also for Ying's suggestion about separate 'sigpending' to another cache
line than '__refcount', it can not heal the regression either.

Thanks,
Feng
--===============0127473572941514430==--

