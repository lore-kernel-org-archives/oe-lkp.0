Content-Type: multipart/mixed; boundary="===============0343155925075324567=="
MIME-Version: 1.0
From: Huang Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 721c21c17ab: +11.7% will-it-scale.per_thread_ops
Date: Thu, 12 Feb 2015 12:56:31 +0800
Message-ID: <1423716991.5968.125.camel@intel.com>
In-Reply-To: <1423114910.5968.9.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0343155925075324567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-02-05 at 13:41 +0800, Huang Ying wrote:
> On Tue, 2015-02-03 at 10:27 +0000, Will Deacon wrote:
> > On Tue, Feb 03, 2015 at 07:45:04AM +0000, Huang Ying wrote:
> > > FYI, we noticed the below changes on
> > > =

> > > commit 721c21c17ab958abf19a8fc611c3bd4743680e38 ("mm: mmu_gather: use
> > > tlb->end !=3D 0 only for TLB invalidation")
> > =

> > Is this delta relative to the previous commit, or something else? The
> > commit in question restored some 3.18 behaviour on task exit (namely
> > doing a fullmm TLB flush), so it would be interesting to know if you
> > see the same change against 3.18.
> =

> Sorry for late.  The delta is relative to the previous commit.  I will
> queue some test for 3.18 to check.

The test result for v3.18 compared with the commit 721c21c is as below.
You can find that the difference between v3.18 and 721c21c should be
less that between v3.18 and the previous commit (parent) for
will-it-scale.per_thread_ops.  I think this is expected.

testbox/testcase/testparams: nhm4/will-it-scale/performance-pread2

           v3.18  721c21c17ab958abf19a8fc611
----------------  --------------------------
         %stddev     %change         %stddev
             \          |                \  =

  31541022 =C2=B1  0%     -12.2%   27698665 =C2=B1  0%  will-it-scale.time.=
voluntary_context_switches
   1079302 =C2=B1  0%      -6.3%    1011350 =C2=B1  2%  will-it-scale.per_p=
rocess_ops
      0.04 =C2=B1  0%      -4.5%       0.03 =C2=B1  1%  will-it-scale.scala=
bility
   1038581 =C2=B1  0%      -3.2%    1005724 =C2=B1  0%  will-it-scale.per_t=
hread_ops

Best Regards,
Huang, Ying



--===============0343155925075324567==--

