Content-Type: multipart/mixed; boundary="===============8643233809029257891=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 2d146aa3aa: vm-scalability.throughput -36.4% regression
Date: Thu, 02 Sep 2021 11:46:28 +0800
Message-ID: <20210902034628.GA76472@shbuild999.sh.intel.com>
In-Reply-To: <e8d087a4-a286-3561-66ef-1e9cfb38605f@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8643233809029257891==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 07:23:24PM -0700, Andi Kleen wrote:
> =

> On 9/1/2021 6:35 PM, Feng Tang wrote:
> >On Wed, Sep 01, 2021 at 08:12:24AM -0700, Andi Kleen wrote:
> >>Feng Tang <feng.tang@intel.com> writes:
> >>>Yes, the tests I did is no matter where the 128B padding is added, the
> >>>performance can be restored and even improved.
> >>I wonder if we can find some cold, rarely accessed, data to put into the
> >>padding to not waste it. Perhaps some name strings? Or the destroy
> >>support, which doesn't sound like its commonly used.
> >Yes, I tried to move 'destroy_work', 'destroy_rwork' and 'parent' over
> >before the 'refcnt' together with some padding, it restored the performa=
nce
> >to about 10~15% regression. (debug patch pasted below)
> >
> >But I'm not sure if we should use it, before we can fully explain the
> >regression.
> =

> Narrowing it down to a single prefetcher seems good enough to me. The
> behavior of the prefetchers is fairly complicated and hard to predict, so=
 I
> doubt you'll ever get a 100% step by step explanation.

Yes, I'm afriad so, given that the policy/algorithm used by perfetcher
keeps changing from generation to generation.

I will test the patch more with other benchmarks.

Thanks,
Feng

> =

> -Andi
>=20
--===============8643233809029257891==--

