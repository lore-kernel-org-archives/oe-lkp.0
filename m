Content-Type: multipart/mixed; boundary="===============1651064100320439976=="
MIME-Version: 1.0
From: Nathan Chancellor <nathan@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm] f35b5d7d67: will-it-scale.per_process_ops -95.5% regression
Date: Thu, 20 Oct 2022 10:16:17 -0700
Message-ID: <Y1GCYXGtEVZbcv/5@dev-arch.thelio-3990X>
In-Reply-To: <366045a27a96e01d0526d63fd78d4f3c5d1f530b.camel@surriel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1651064100320439976==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Rik,

On Thu, Oct 20, 2022 at 11:28:16AM -0400, Rik van Riel wrote:
> On Thu, 2022-10-20 at 13:07 +0800, Huang, Ying wrote:
> > =

> > Nathan Chancellor <nathan@kernel.org> writes:
> > > =

> > > For what it's worth, I just bisected a massive and visible
> > > performance
> > > regression on my Threadripper 3990X workstation to commit
> > > f35b5d7d676e
> > > ("mm: align larger anonymous mappings on THP boundaries"), which
> > > seems
> > > directly related to this report/analysis. I initially noticed this
> > > because my full set of kernel builds against mainline went from 2
> > > hours
> > > and 20 minutes or so to over 3 hours. Zeroing in on x86_64
> > > allmodconfig,
> > > which I used for the bisect:
> > > =

> > > @ 7b5a0b664ebe ("mm/page_ext: remove unused variable in
> > > offline_page_ext"):
> > > =

> > > Benchmark 1: make -skj128 LLVM=3D1 allmodconfig all
> > > =C2=A0 Time (mean =C2=B1 =CF=83):=C2=A0=C2=A0=C2=A0=C2=A0 318.172 s =
=C2=B1=C2=A0 0.730 s=C2=A0=C2=A0=C2=A0 [User: 31750.902 s,
> > > System: 4564.246 s]
> > > =C2=A0 Range (min =E2=80=A6 max):=C2=A0=C2=A0 317.332 s =E2=80=A6 318=
.662 s=C2=A0=C2=A0=C2=A0 3 runs
> > > =

> > > @ f35b5d7d676e ("mm: align larger anonymous mappings on THP
> > > boundaries"):
> > > =

> > > Benchmark 1: make -skj128 LLVM=3D1 allmodconfig all
> > >   Time (mean =C2=B1 =CF=83):     406.688 s =C2=B1  0.676 s    [User: =
31819.526 s,
> System: 16327.022 s]
> > >   Range (min =E2=80=A6 max):   405.954 s =E2=80=A6 407.284 s    3 run
> > =

> > Have you tried to build with gcc?=C2=A0 Want to check whether is this
> > clang
> > specific issue or not.
> =

> This may indeed be something LLVM specific. In previous tests,
> GCC has generally seen a benefit from increased THP usage.
> Many other applications also benefit from getting more THPs.

Indeed, GCC builds actually appear to be slightly faster on my system now,
apologies for not trying that before reporting :/

7b5a0b664ebe:

Benchmark 1: make -skj128 allmodconfig all
  Time (mean =C2=B1 =CF=83):     355.294 s =C2=B1  0.931 s    [User: 33620.=
469 s, System: 6390.064 s]
  Range (min =E2=80=A6 max):   354.571 s =E2=80=A6 356.344 s    3 runs

f35b5d7d676e:

Benchmark 1: make -skj128 allmodconfig all
  Time (mean =C2=B1 =CF=83):     347.400 s =C2=B1  2.029 s    [User: 34389.=
724 s, System: 4603.175 s]
  Range (min =E2=80=A6 max):   345.815 s =E2=80=A6 349.686 s    3 runs

> LLVM showing 10% system time before this change, and a whopping
> 30% system time after that change, suggests that LLVM is behaving
> quite differently from GCC in some ways.

The above tests were done with GCC 12.2.0 from Arch Linux. The previous LLVM
tests were done with a self-compiled version of LLVM from the main branch
(16.0.0), optimized with BOLT [1]. To eliminate that as a source of issues,=
 I
used my distribution's version of clang (14.0.6) and saw similar results as
before:

7b5a0b664ebe:

Benchmark 1: make -skj128 LLVM=3D/usr/bin/ allmodconfig all
  Time (mean =C2=B1 =CF=83):     462.517 s =C2=B1  1.214 s    [User: 48544.=
240 s, System: 5586.212 s]
  Range (min =E2=80=A6 max):   461.115 s =E2=80=A6 463.245 s    3 runs

f35b5d7d676e:

Benchmark 1: make -skj128 LLVM=3D/usr/bin/ allmodconfig all
  Time (mean =C2=B1 =CF=83):     547.927 s =C2=B1  0.862 s    [User: 47913.=
709 s, System: 17682.514 s]
  Range (min =E2=80=A6 max):   547.429 s =E2=80=A6 548.922 s    3 runs

> If we can figure out what these differences are, maybe we can
> just fine tune the code to avoid this issue.
> =

> I'll try to play around with LLVM compilation a little bit next
> week, to see if I can figure out what might be going on. I wonder
> if LLVM is doing lots of mremap calls or something...

If there is any further information I can provide or patches I can test,
I am more than happy to do so.

[1]: https://github.com/llvm/llvm-project/tree/96552e73900176d65ee6650facae=
8d669d6f9498/bolt

Cheers,
Nathan
--===============1651064100320439976==--

