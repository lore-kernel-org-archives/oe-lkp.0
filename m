Content-Type: multipart/mixed; boundary="===============2036484086297147039=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 9ad0e5683d: IP-Config: Auto-configuration of network failed
Date: Fri, 23 Sep 2016 10:57:39 +0200
Message-ID: <20160923085739.GD5008@twins.programming.kicks-ass.net>
In-Reply-To: <57e4c161.MiEMQYhmcAoFwGMQ%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2036484086297147039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2016 at 01:45:05PM +0800, kernel test robot wrote:
> =

> FYI, we noticed the following commit:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/tmp
> commit 9ad0e5683d900d3ea5f301768f8d35b54840c17a ("sched/fair: Optimize en=
queue_entity()")
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap =
-smp 2 -m 1G
> =

> caused below changes:
> =

> =

> +-------------------------------------------------+------------+---------=
---+
> |                                                 | 8ffaffa57c | 9ad0e568=
3d |
> +-------------------------------------------------+------------+---------=
---+
> | boot_successes                                  | 515        | 31      =
   |
> | boot_failures                                   | 25         | 80      =
   |

Does that mean its still failing to boot the parent (8ffaffa57c)
sometimes (25 out of 515+25 times) ?

> [  149.727601] . timed out!
> [  179.734646] usb0: eth_stop
> [  179.735026] usb0: stop stats: rx/tx 0/0, errs 0/0
> [  179.735795] IP-Config: Auto-configuration of network failed
> [  179.737438] debug: unmapping init [mem 0xffffffff877f3000-0xffffffff87=
ba1fff]
> [  179.741788] Write protecting the kernel read-only data: 26624k
> [  179.777839] debug: unmapping init [mem 0xffff9afbb0b1e000-0xffff9afbb0=
bfffff]

Would you have a filesystem image to go with that so I can try and
reproduce?

--===============2036484086297147039==--

