Content-Type: multipart/mixed; boundary="===============6416642654691179276=="
MIME-Version: 1.0
From: Byungchul Park <byungchul.park@lge.com>
To: lkp@lists.01.org
Subject: Re: 904fe37946 ("sched/deadline: Set cp->elements[0].cpu to -1 .."): BUG: KASAN: slab-out-of-bounds in cpudl_init
Date: Tue, 05 Jun 2018 10:58:42 +0900
Message-ID: <79788929-c5ef-3b83-7a8c-c5210651de1a@lge.com>
In-Reply-To: <5b157273.DXE/vn1Jnu0gJv+g%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6416642654691179276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2018-06-05 02:10, kernel test robot wrote:
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://github.com/0day-ci/linux/commits/Byungchul-Park/sched-deadline-Ad=
d-cpudl_maximum_dl-for-better-readability/20180604-160549

I'm very sorry this has a typo making the following bug.

I sent the v5 spin as soon as I'd sent this v4 patches.

Anyway thanks you very much for checking this.

Please ignore this v4 but check v5. :(

> commit 904fe379467abff0cf6875768f1dba99b329d056
> Author:     Byungchul Park <byungchul.park@lge.com>
> AuthorDate: Mon Jun 4 15:36:47 2018 +0900
> Commit:     0day robot <lkp@intel.com>
> CommitDate: Mon Jun 4 16:05:50 2018 +0800
> =

>      sched/deadline: Set cp->elements[0].cpu to -1 when the heap is empty
>      =

>      Hello Steven and Daniel,
>      =

>      I've changed the 2nd patch a little bit to consider cpudl_clear()
>      additionally. Can I keep your Acked-by on?
>      =

>      (I temporarily removed the Acked-by you gave me.)
>      =

>      Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>      Acked-by: Daniel Bristot de Oliveira <bristot@redhat.com>
>      =

>      -----8<-----
>      From 1e368d276186c22f9da298206c718b33e805828d Mon Sep 17 00:00:00 20=
01
>      From: Byungchul Park <byungchul.park@lge.com>
>      Date: Mon, 4 Jun 2018 15:05:08 +0900
>      Subject: [PATCH v4 2/2] sched/deadline: Set cp->elements[0].cpu to -=
1 when the
>       heap is empty
>      =

>      Currently, migrating tasks to cpu0 unconditionally happens when the
>      heap is empty, since cp->elements[0].cpu is initialized to 0(=3Dcpu0=
).
>      We have to distinguish between the empty case and cpu0 to avoid the
>      unnecessary migrations. Therefore, it has to return an invalid value
>      e.i. -1 in the case the heap is empty.
>      =

>      Signed-off-by: Byungchul Park <byungchul.park@lge.com>
>      Suggested-by: Joel Fernandes <joelaf@google.com>
> =

> ea400ccde0  sched/deadline: Add cpudl_maximum_dl() for better readability
> 904fe37946  sched/deadline: Set cp->elements[0].cpu to -1 when the heap i=
s empty
> +------------------------------------------------------------------+-----=
-------+------------+
> |                                                                  | ea40=
0ccde0 | 904fe37946 |
> +------------------------------------------------------------------+-----=
-------+------------+
> | boot_successes                                                   | 17  =
       | 0          |
> | boot_failures                                                    | 13  =
       | 23         |
> | invoked_oom-killer:gfp_mask=3D0x                                   | 10=
         | 11         |
> | Mem-Info                                                         | 13  =
       | 11         |
> | Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes | 10  =
       | 11         |
> | BUG:KASAN:slab-out-of-bounds_in_c                                | 0   =
       | 23         |
> +------------------------------------------------------------------+-----=
-------+------------+
> =

> [    0.000000] Inode-cache hash table entries: 32768 (order: 6, 262144 by=
tes)
> [    0.000000] Memory: 157120K/523752K available (14348K kernel code, 257=
56K rwdata, 6296K rodata, 1776K init, 21076K bss, 366604K reserved, 0K cma-=
reserved)
> [    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D1,=
 Nodes=3D1
> [    0.000000] ftrace: allocating 29382 entries in 115 pages
> [    0.010000] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    0.010000] BUG: KASAN: slab-out-of-bounds in cpudl_init+0x100/0x120
> [    0.010000] Write of size 4 at addr ffff880000082058 by task swapper/0
> [    0.010000]
> [    0.010000] CPU: 0 PID: 0 Comm: swapper Not tainted 4.17.0-rc6-00218-g=
904fe37 #3
> [    0.010000] Call Trace:
> [    0.010000]  dump_stack+0xd8/0x106
> [    0.010000]  print_address_description+0xa3/0x2b0
> [    0.010000]  ? cpudl_init+0x100/0x120
> [    0.010000]  kasan_report+0x236/0x3b0
> [    0.010000]  cpudl_init+0x100/0x120
> [    0.010000]  init_rootdomain+0xef/0x170
> [    0.010000]  init_defrootdomain+0x11/0x30
> [    0.010000]  sched_init+0x199/0x709
> [    0.010000]  start_kernel+0x329/0x6b4
> [    0.010000]  ? mem_encrypt_init+0x6/0x6
> [    0.010000]  ? ftrace_likely_update+0x25/0x40
> [    0.010000]  ? memcpy_orig+0x54/0x110
> [    0.010000]  secondary_startup_64+0xa5/0xb0
> [    0.010000]
> [    0.010000] Allocated by task 0:
> [    0.010000]  kasan_kmalloc+0xa9/0xc0
> [    0.010000]  __kmalloc+0x32d/0x380
> [    0.010000]  cpudl_init+0x57/0x120
> [    0.010000]  init_rootdomain+0xef/0x170
> [    0.010000]  init_defrootdomain+0x11/0x30
> [    0.010000]  sched_init+0x199/0x709
> [    0.010000]  start_kernel+0x329/0x6b4
> [    0.010000]  secondary_startup_64+0xa5/0xb0
> [    0.010000]
> [    0.010000] Freed by task 0:
> [    0.010000] (stack is not available)
> [    0.010000]
> [    0.010000] The buggy address belongs to the object at ffff880000082040
> =

>                                                            # HH:MM RESULT=
 GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 06d3ea331f08c3dec19a736167080383e77a8cbe 29dcea88779c856=
c7dc92040a0c01233263101d4 --
> git bisect  bad 9488b5c8b2eb5f4843594e11d38b419c704de8c6  # 18:52  B     =
 0     2   16   0  Merge 'linux-review/Byungchul-Park/sched-deadline-Add-cp=
udl_maximum_dl-for-better-readability/20180604-160549' into devel-catchup-2=
01806041747
> git bisect good 4efb271e29f0189b887e88ef35a3d369515fa946  # 19:26  G     =
10     0    8  12  Merge 'm68k/master' into devel-catchup-201806041747
> git bisect good 2379724d1e0a80d2a9c54b4fd1fae2e41aa8c468  # 19:51  G     =
10     0    6  10  Merge 'm68k/for-linus' into devel-catchup-201806041747
> git bisect good 8372022aecb51acc209c8f0300aca8c72ba991d1  # 20:34  G     =
11     0    6   8  Merge 'linux-review/nixiaoming/net-dns_resolver-dns_quer=
y-Modify-parameter-checking-to-avoid-dead-code/20180604-150907' into devel-=
catchup-201806041747
> git bisect good 05abc6f8056a8a19450f84e3bd615415158ea1f2  # 20:58  G     =
10     0    7  11  Merge 'linux-review/M-t-Eckl/test-py-Add-test-cases-for-=
socket-matching/20180604-162051' into devel-catchup-201806041747
> git bisect good ac5bd9b79914dd88720bd72991f018523ea488a4  # 21:19  G     =
10     0    4   6  Merge 'linux-review/Hean-Loong-Ong/Intel-FPGA-Video-and-=
Image-Processing-Suite/20180604-153816' into devel-catchup-201806041747
> git bisect  bad 904fe379467abff0cf6875768f1dba99b329d056  # 00:00  B     =
 0     1   27  12  sched/deadline: Set cp->elements[0].cpu to -1 when the h=
eap is empty
> git bisect good ea400ccde011101e09eed33733e5dd1b34631172  # 00:14  G     =
10     0    4  14  sched/deadline: Add cpudl_maximum_dl() for better readab=
ility
> # first bad commit: [904fe379467abff0cf6875768f1dba99b329d056] sched/dead=
line: Set cp->elements[0].cpu to -1 when the heap is empty
> git bisect good ea400ccde011101e09eed33733e5dd1b34631172  # 00:36  G     =
32     0   15  29  sched/deadline: Add cpudl_maximum_dl() for better readab=
ility
> # extra tests with debug options
> git bisect  bad 904fe379467abff0cf6875768f1dba99b329d056  # 00:50  B     =
 0     2   18   2  sched/deadline: Set cp->elements[0].cpu to -1 when the h=
eap is empty
> # extra tests on HEAD of linux-devel/devel-catchup-201806041747
> git bisect  bad 06d3ea331f08c3dec19a736167080383e77a8cbe  # 00:55  B     =
 0    13   30   0  0day head guard for 'devel-catchup-201806041747'
> # extra tests on tree/branch linux-review/Byungchul-Park/sched-deadline-A=
dd-cpudl_maximum_dl-for-better-readability/20180604-160549
> git bisect  bad 904fe379467abff0cf6875768f1dba99b329d056  # 01:00  B     =
 0    23   37   0  sched/deadline: Set cp->elements[0].cpu to -1 when the h=
eap is empty
> # extra tests with first bad commit reverted
> git bisect good 01ac200369ad0cbeba9e877d8f5f59b546fe1be9  # 01:09  G     =
11     0    5  13  Revert "sched/deadline: Set cp->elements[0].cpu to -1 wh=
en the heap is empty"
> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/lkp                          Intel Corpora=
tion
> =


-- =

Thanks,
Byungchul

--===============6416642654691179276==--

