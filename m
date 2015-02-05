Content-Type: multipart/mixed; boundary="===============3110956976567404061=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 721c21c17ab: +11.7% will-it-scale.per_thread_ops
Date: Thu, 05 Feb 2015 13:41:50 +0800
Message-ID: <1423114910.5968.9.camel@linux.intel.com>
In-Reply-To: <20150203102746.GA25497@arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3110956976567404061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2015-02-03 at 10:27 +0000, Will Deacon wrote:
> On Tue, Feb 03, 2015 at 07:45:04AM +0000, Huang Ying wrote:
> > FYI, we noticed the below changes on
> > =

> > commit 721c21c17ab958abf19a8fc611c3bd4743680e38 ("mm: mmu_gather: use
> > tlb->end !=3D 0 only for TLB invalidation")
> =

> Is this delta relative to the previous commit, or something else? The
> commit in question restored some 3.18 behaviour on task exit (namely
> doing a fullmm TLB flush), so it would be interesting to know if you
> see the same change against 3.18.

Sorry for late.  The delta is relative to the previous commit.  I will
queue some test for 3.18 to check.

Best Regards,
Huang, Ying



--===============3110956976567404061==--

