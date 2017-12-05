Content-Type: multipart/mixed; boundary="===============6636717118585250813=="
MIME-Version: 1.0
From: Namhyung Kim <namhyung@kernel.org>
To: lkp@lists.01.org
Subject: Re: BUG: KASAN: slab-out-of-bounds in perf_callchain_user+0x494/0x530
Date: Tue, 05 Dec 2017 17:11:56 +0900
Message-ID: <20171205081156.GB16663@sejong>
In-Reply-To: <20171130193712.GU3298@kernel.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6636717118585250813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Nov 30, 2017 at 04:37:12PM -0300, Arnaldo Carvalho de Melo wrote:
> Em Thu, Nov 30, 2017 at 09:20:26AM +0100, Peter Zijlstra escreveu:
> > On Thu, Nov 30, 2017 at 10:32:19AM +0800, Fengguang Wu wrote:
> > > Hello,
> > > =

> > > FYI this happens in mainline kernel 4.15.0-rc1.
> > > It looks like a new regression and hard to bisect.
> > > =

> > > It occurs in 1 out of 57 boots.
> > > =

> > > [   10.009610] chown (367) used greatest stack depth: 26944 bytes left
> > > Kernel tests: Boot OK!
> > > [   30.357729] trinity-main uses obsolete (PF_INET,SOCK_PACKET)
> > > [   31.301433] sock: process `trinity-main' is using obsolete setsock=
opt SO_BSDCOMPAT
> > > [   31.310289] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > [   31.311490] BUG: KASAN: slab-out-of-bounds in perf_callchain_user+=
0x494/0x530:
> > > 						perf_callchain_store at include/linux/perf_event.h:1128
> > > 						 (inlined by) perf_callchain_user at arch/x86/events/core.c:2485
> > =

> > I don't think we recently changed anything here...
> > =

> > But I do have vague memories of something being off here; I never quite
> > could penetrate the max_stack / contexts_maxed stuff, and istr acme was
> > going to have a peek.
>  =

> Sure, but I saw some backward ring buffer stuff in there as well, no?
> IIRC that came after the max-stack code, Adding Wang to the CC list.

I think it's because of per-event max-stack not being checked for the
first event.  Please see the patch below..

Also I'm not sure that the allocation failure check would work
correctly since it decrements nr_callchain_events when it fails.

Thanks,
Namhyung



>From c12126c4ff9835f0899619db3ee7b4a3151ff2bb Mon Sep 17 00:00:00 2001
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 5 Dec 2017 16:54:50 +0900
Subject: [PATCH] perf/core: Fix overflow on perf_callchain_entry

The commit 97c79a38cd45 add a check whether per-event max stack is
greater than the global max.  But it missed to do it for the first
event.  So if the event had a stack depth greater than the global max,
it could overflow the callchain entry list.

Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Fixes: 97c79a38cd45 ("perf core: Per event callchain limit")
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 kernel/events/callchain.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/kernel/events/callchain.c b/kernel/events/callchain.c
index 1b2be63c8528..e449e23802eb 100644
--- a/kernel/events/callchain.c
+++ b/kernel/events/callchain.c
@@ -119,19 +119,22 @@ int get_callchain_buffers(int event_max_stack)
 		goto exit;
 	}
 =

+	/*
+	 * If requesting per event more than the global cap,
+	 * return a different error to help userspace figure this out.
+	 *
+	 * And also do it here so that we have &callchain_mutex held.
+	 */
+	if (event_max_stack > sysctl_perf_event_max_stack) {
+		err =3D -EOVERFLOW;
+		goto exit;
+	}
+
 	if (count > 1) {
 		/* If the allocation failed, give up */
 		if (!callchain_cpus_entries)
 			err =3D -ENOMEM;
-		/*
-		 * If requesting per event more than the global cap,
-		 * return a different error to help userspace figure
-		 * this out.
-		 *
-		 * And also do it here so that we have &callchain_mutex held.
-		 */
-		if (event_max_stack > sysctl_perf_event_max_stack)
-			err =3D -EOVERFLOW;
+
 		goto exit;
 	}
 =

-- =

2.15.0


--===============6636717118585250813==--

