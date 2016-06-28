Content-Type: multipart/mixed; boundary="===============3313847760705562935=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 0329dacce8: pigz.throughput 95.9% improvement
Date: Tue, 28 Jun 2016 08:57:56 +0200
Message-ID: <20160628065756.GT30921@twins.programming.kicks-ass.net>
In-Reply-To: <20160628015311.GF19084@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============3313847760705562935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 09:53:11AM +0800, kernel test robot wrote:
> =

> FYI, we noticed a 95.9% improvement of pigz.throughput due to commit:
> =

> commit 0329dacce87d6741b391d73cab1ec831a3262d6b ("sched/fair: Fix effecti=
ve_load()")
> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/ur=
gent
> =

> in testcase: pigz
> on test machine: Sandy Bridge-EP with 32G memory
> with following parameters: blocksize=3D128K/cpufreq_governor=3Dperformanc=
e/nr_threads=3D100%

Ok, so where and what is pigz ? There doesn't seem to be anything useful
included in this email to give clue.

--===============3313847760705562935==--

