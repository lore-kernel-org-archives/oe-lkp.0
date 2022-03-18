Content-Type: multipart/mixed; boundary="===============1352986470320665082=="
MIME-Version: 1.0
From: Dave Hansen <dave.hansen@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mm/tlb] 6035152d8e: will-it-scale.per_thread_ops -13.2% regression
Date: Thu, 17 Mar 2022 17:16:18 -0700
Message-ID: <dd8be93c-ded6-b962-50d4-96b1c3afb2b7@intel.com>
In-Reply-To: <DC37F01B-A80F-4839-B4FB-C21F64943E64@vmware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1352986470320665082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 3/17/22 13:32, Nadav Amit wrote:
> I=E2=80=99m not married to this patch, but before a revert it would be go=
od
> to know why it even matters. I wonder whether you can confirm that
> reverting the patch (without the rest of the series) even helps. If
> it does, I=E2=80=99ll try to run some tests to understand what the heck is
> going on.

I went back and tested on a "Intel(R) Core(TM) i7-8086K CPU @ 4.00GHz"
which is evidently a 6-core "Coffee Lake".  It needs retpolines:

> /sys/devices/system/cpu/vulnerabilities/spectre_v2:Mitigation: Full
generic retpoline, IBPB: conditional, IBRS_FW, STIBP: conditional, RSB
filling

I ran the will-it-scale test:

	./malloc1_threads -s 30 -t 12

and took the 30-second average "ops/sec" at the two commits:

	4c1ba3923e:197876
	6035152d8e:199367 +0.75%

Where bigger is better.  So, a small win, but probably mostly in the
noise.  The number of IPIs definitely went up, probably 3-4% to get that
win.

IPI costs go up the more threads you throw at it.  The retpolines do
too, though because you do *more* of them.  Systems with no retpolines
get hit harder by the IPI costs and have no upsides from removing the
retpoline.

So, we've got a small (<1%, possibly zero) win on the bulk of systems
(which have retpolines).  Newer, retpoline-free systems see a
double-digit regression.  The bigger the system, the bigger the
regression (probably).

I tend to think the bigger regression wins and we should probably revert
the patch, or@least back out its behavior.

Nadav, do you have some different data or a different take?
--===============1352986470320665082==--

