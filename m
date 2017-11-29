Content-Type: multipart/mixed; boundary="===============7847108994275955185=="
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [lib/rbtree, drm/mm] 0e1fa66f34: WARNING:at_lib/stackdepot.c:#depot_save_stack
Date: Wed, 29 Nov 2017 10:28:15 +0000
Message-ID: <151195129581.10143.7173351182825117041@mail.alporthouse.com>
In-Reply-To: <20171128025335.GI21779@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7847108994275955185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting kernel test robot (2017-11-28 02:53:35)
> =

> FYI, we noticed the following commit (built with gcc-7):
> =

> commit: 0e1fa66f34ddace74e4f0e37697a077de49b43a8 ("lib/rbtree,drm/mm: Add=
 rbtree_replace_node_cached()")
> git://anongit.freedesktop.org/drm/drm-intel topic/core-for-CI
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -m 512M
> =

> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
> =

> =

> +-------------------------------------------------------+------------+---=
---------+
> |                                                       | d576dd33ec | 0e=
1fa66f34 |
> +-------------------------------------------------------+------------+---=
---------+
> | boot_successes                                        | 0          | 0 =
         |
> | boot_failures                                         | 18         | 20=
         |
> | WARNING:possible_circular_locking_dependency_detected | 18         | 20=
         |
> | genirq:Flags_mismatch_irq##(ttyS0)vs.#(sir_ir)        | 18         | 20=
         |
> | INFO:rcu_sched_self-detected_stall_on_CPU             | 6          | 3 =
         |
> | WARNING:at_lib/stackdepot.c:#depot_save_stack         | 0          | 20=
         |
> | RIP:depot_save_stack                                  | 0          | 20=
         |
> +-------------------------------------------------------+------------+---=
---------+
> =

> =

> =

> [   61.885268] WARNING: CPU: 0 PID: 1 at lib/stackdepot.c:119 depot_save_=
stack+0x283/0x560

This warning is "Stack depot reached limit capacity" so we are just
exceeding the number of nodes that can be tracked in the test harness.

Remind me to replace with an XArray when they land.
-Chris

--===============7847108994275955185==--

