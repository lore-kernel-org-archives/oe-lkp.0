Content-Type: multipart/mixed; boundary="===============6965102877003289171=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched] WARNING: CPU: 0 PID: 11 at kernel/sched/core.c:1188 do_set_cpus_allowed()
Date: Mon, 15 Jun 2015 14:25:26 +0200
Message-ID: <20150615122526.GZ3644@twins.programming.kicks-ass.net>
In-Reply-To: <20150614085259.GA1911@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6965102877003289171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2015 at 04:52:59PM +0800, Fengguang Wu wrote:
> Hi Peter,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core

Yeah sorry, just mark this tree broken until it changes. I've just not
had time to go fix that commit :/

--===============6965102877003289171==--

