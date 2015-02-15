Content-Type: multipart/mixed; boundary="===============2006449826446128664=="
MIME-Version: 1.0
From: Frederic Weisbecker <fweisbec@gmail.com>
To: lkp@lists.01.org
Subject: Re: [sched] BUG: kernel boot hang
Date: Sun, 15 Feb 2015 16:46:22 +0100
Message-ID: <20150215154620.GC8838@lerouge>
In-Reply-To: <1423986208.5538.5.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2006449826446128664==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 15, 2015 at 03:43:28PM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> commit a18b5d01819235629289212ad428a5ee2b40f0d9 ("sched: Fix missing pree=
mption opportunity")

Huang,

Can you please test the following patch and check if it still crashes?

Thanks.


diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index c017a5f..a6d4d6c 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2879,7 +2879,7 @@ void __sched schedule_preempt_disabled(void)
 	preempt_disable();
 }
 =

-static void preempt_schedule_common(void)
+static void __sched notrace preempt_schedule_common(void)
 {
 	do {
 		preempt_count_add(PREEMPT_ACTIVE);


--===============2006449826446128664==--

