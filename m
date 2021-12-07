Content-Type: multipart/mixed; boundary="===============2722746692871368447=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/signal] 3aac3ebea0: will-it-scale.per_thread_ops -11.9% regression
Date: Tue, 07 Dec 2021 15:14:38 -0800
Message-ID: <bbc24579-b6ee-37cb-4bbf-10e3476537e0@intel.com>
In-Reply-To: <20211207012128.GA16074@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2722746692871368447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/6/21 5:21 PM, kernel test robot wrote:
> =

> 1bdda24c4af64cd2 3aac3ebea08f2d342364f827c89 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     980404 =C2=B1  3%     -10.2%     880436 =C2=B1  2%  will-it-scale.16.=
threads
>      61274 =C2=B1  3%     -10.2%      55027 =C2=B1  2%  will-it-scale.per=
_thread_ops
>     980404 =C2=B1  3%     -10.2%     880436 =C2=B1  2%  will-it-scale.wor=
kload
>    9745749 =C2=B1 18%     +26.8%   12356608 =C2=B1  4%  meminfo.DirectMap=
2M

Something else funky is going on here.  Why would there all of a sudden
be so many more 2M pages in the direct map?  I also see gunk like
interrupts on the network card going up.  I can certainly see that
happening if something else on the network was messing around.

Granted, this was seen across several systems, but it's really odd.  I
guess I'll go try to dig up one of the actual ones where this was seen.

I tried on a smaller Skylake system and I don't see any regression at
all or any interesting delta in a perf profile.

Oliver or Chang, could you try to reproduce this by hand on one of the
suspect systems?  Build:

  1bdda24c4a ("signal: Add an optional check for altstack size")

then run will-it-scale by hand.  Then build:

  3aac3ebea0 ("x86/signal: Implement sigaltstack size validation")

and run it again.  Also, do we see any higher core-count regressions?
These all seem to happen with:

	mode=3Dthread
	nr_task=3D16

That's really odd to see that for these systems with probably ~50 cores
each.  I'd expect to see it get worse at higher core counts.
--===============2722746692871368447==--

