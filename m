Content-Type: multipart/mixed; boundary="===============0323945302731395971=="
MIME-Version: 1.0
From: Will Deacon <will.deacon@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm] 721c21c17ab: +11.7% will-it-scale.per_thread_ops
Date: Tue, 03 Feb 2015 10:27:46 +0000
Message-ID: <20150203102746.GA25497@arm.com>
In-Reply-To: <1422949504.13951.5.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0323945302731395971==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2015 at 07:45:04AM +0000, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> commit 721c21c17ab958abf19a8fc611c3bd4743680e38 ("mm: mmu_gather: use
> tlb->end !=3D 0 only for TLB invalidation")

Is this delta relative to the previous commit, or something else? The
commit in question restored some 3.18 behaviour on task exit (namely
doing a fullmm TLB flush), so it would be interesting to know if you
see the same change against 3.18.

Will

--===============0323945302731395971==--

