Content-Type: multipart/mixed; boundary="===============5651458019395210721=="
MIME-Version: 1.0
From: Matthew Wilcox <willy@infradead.org>
To: lkp@lists.01.org
Subject: Re: [page cache] eb797a8ee0: vm-scalability.throughput -16.5% regression
Date: Wed, 14 Nov 2018 06:17:13 -0800
Message-ID: <20181114141713.GA25731@bombadil.infradead.org>
In-Reply-To: <20181114092242.GD18977@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============5651458019395210721==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 14, 2018 at 05:22:42PM +0800, kernel test robot wrote:
> FYI, we noticed a -16.5% regression of vm-scalability.throughput due to c=
ommit:
> commit: eb797a8ee0ab4cd03df556980ce7bf167cadaa50 ("page cache: Rearrange =
address_space")
> =

> in testcase: vm-scalability
> on test machine: 80 threads Skylake with 64G memory
> with following parameters:
> =

> 	runtime: 300s
> 	test: small-allocs
> 	cpufreq_governor: performance

Thanks for the report.  I am surprised by it, because I can't see what
could have caused this.  On a 64-bit system (which your test is using),
here's the effect of that patch:

gfp_mask moves from being with private_lock up into a hole adjacent
to i_mmap_writable.
wb_err moves from the end of the array up to be with private_lock.
address_space shrinks by 8 bytes.

Hmm.  Might the shrinking be the problem?  Something in struct inode is
now split across two cachelines, or is no longer in the same cacheline
as something else?

I'm at Plumbers this week, so I don't have much time to investigate,
but this regression is very important to me and I shall dig into this
when I can.  It's OK to revert this commit in the meantime; nothing
depends on it yet.

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> | testcase: change | unixbench: unixbench.score 20.9% improvement        =
                 |

Huh.  If we had to choose, would a 20.9% improvement in unixbench be more
important than a 16.5% penalty to will-it-scale?


--===============5651458019395210721==--

