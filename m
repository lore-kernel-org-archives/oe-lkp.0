Content-Type: multipart/mixed; boundary="===============6079150830511448341=="
MIME-Version: 1.0
From: Roopa Prabhu <roopa@cumulusnetworks.com>
To: lkp@lists.01.org
Subject: Re: 494344d6e6 ("vxlan: support for nexthop notifiers"): [ 6.235374] BUG: spinlock trylock failure on UP on CPU#0, swapper/1
Date: Sat, 23 May 2020 11:07:21 -0700
Message-ID: <CAJieiUjfSYwb3odjg+hFm-08cEE3pW12J4ZO2ODoSGriHWMVCA@mail.gmail.com>
In-Reply-To: <20200523133812.GE12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6079150830511448341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2020 at 6:38 AM kernel test robot <lkp@intel.com> wrote:

> Greetings,
>
> 0day kernel testing robot got the below dmesg and the first bad commit is
>
>
> https://github.com/0day-ci/linux/commits/Roopa-Prabhu/Support-for-fdb-ECM=
P-nexthop-groups/20200521-054241
>
> commit 494344d6e6e348b1866d75998efe873203a5f2e6
> Author:     Roopa Prabhu <roopa@cumulusnetworks.com>
> AuthorDate: Wed May 20 11:23:10 2020 -0700
> Commit:     0day robot <lkp@intel.com>
> CommitDate: Thu May 21 05:42:59 2020 +0800
>
>     vxlan: support for nexthop notifiers
>
>     vxlan driver registers for nexthop add/del notifiers to
>     cleanup fdb entries pointing to such nexthops.
>
>     Signed-off-by: Roopa Prabhu <roopa@cumulusnetworks.com>
>
>
This should be fixed with my later version  in this commit.
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/=
?id=3D8590ceedb70181ad9de5a3dc2cfe50ca33a9576a


Looks Like i attributed kernel test robot in this commit  (and also the
cover letter) instead:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/=
?id=3D38428d68719c454d269cb03b776d8a4b0ad66111


I will keep an eye on further reports on this.

Thanks!.





> 6751c12243  nexthop: add support for notifiers
> 494344d6e6  vxlan: support for nexthop notifiers
> fccc09644f  selftests: net: add fdb nexthop tests
>
> +-------------------------------------------+------------+------------+--=
----------+
> |                                           | 6751c12243 | 494344d6e6 |
> fccc09644f |
>
> +-------------------------------------------+------------+------------+--=
----------+
> | boot_successes                            | 0          | 0          | 0
>         |
> | boot_failures                             | 44         | 11         |
> 11         |
> | BUG:kernel_timeout_in_test_stage          | 41         |            |
>         |
> | BUG:kernel_timeout_in_torture_test_stage  | 3          |            |
>         |
> | BUG:spinlock_trylock_failure_on_UP_on_CPU | 0          | 11         |
> 11         |
>
> +-------------------------------------------+------------+------------+--=
----------+
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <lkp@intel.com>
>
> [    6.231483]     ok 33 - list_test_list_for_each_safe
> [    6.232192]     ok 34 - list_test_list_for_each_prev_safe
> [    6.232748]     ok 35 - list_test_list_for_each_entry
> [    6.233412]     ok 36 - list_test_list_for_each_entry_reverse
> [    6.233859] ok 3 - list-kunit-test
> [    6.235374] BUG: spinlock trylock failure on UP on CPU#0, swapper/1
> [    6.235925]  lock: init_net+0x204/0xe20, .magic: 00000000, .owner:
> <none>/-1, .owner_cpu: 0
> [    6.236600] CPU: 0 PID: 1 Comm: swapper Not tainted 5.7.0-rc5 #1
> [    6.237085] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> 1.12.0-1 04/01/2014
> [    6.237770] Call Trace:
> [    6.237984]  dump_stack+0x32/0x4a
> [    6.238261]  spin_dump+0xae/0x130
> [    6.238540]  do_raw_spin_trylock+0xa1/0xc0
> [    6.238881]  _raw_spin_lock_irqsave+0xbc/0x160
> [    6.239247]  ? atomic_notifier_chain_register+0x24/0x70
> [    6.239675]  atomic_notifier_chain_register+0x24/0x70
> [    6.240089]  register_nexthop_notifier+0x20/0x30
> [    6.240469]  vxlan_init_net+0x202/0x350
> [    6.240790]  ops_init+0x65/0x390
> [    6.241064]  register_pernet_operations+0x13a/0x2d0
> [    6.241464]  ? virtio_net_driver_init+0x10b/0x10b
> [    6.241861]  register_pernet_subsys+0x3d/0x70
> [    6.242217]  vxlan_init_module+0x3e/0xf4
> [    6.242542]  do_one_initcall+0xef/0x6a0
> [    6.242892]  ? rcu_read_lock_sched_held+0x5d/0xd0
> [    6.243279]  ? trace_initcall_level+0x132/0x1cc
> [    6.243657]  do_initcalls+0x16c/0x1ad
> [    6.243964]  kernel_init_freeable+0x1af/0x264
> [    6.244322]  ? rest_init+0x4a0/0x4a0
> [    6.244617]  kernel_init+0x1b/0x280
> [    6.244906]  ret_from_fork+0x2e/0x40
> [    6.260656] debug: unmapping init [mem 0xc43c2000-0xc4566fff]
> [    6.266355] Write protecting kernel text and read-only data: 46568k
> [    6.266886] NX-protecting the kernel data: 23720k
> [    6.267832] Run /init as init process
> [    6.271961]   with arguments:
>
>                                                           # HH:MM RESULT
> GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> git bisect start 1123c0a2ffa14f44554106ffc92488afdb0fa578
> b9bbe6ed63b2b9f2c9ee5cbd0f2c946a2723f4ce --
> git bisect  bad a68db01313720f76c06c324c98f10de7af8fe564  # 16:10  B
> 0     1   17   0  Merge
> 'linux-review/Huang-Qijun/vlan-fix-the-bug-that-cannot-create-vlan4095/20=
200518-133055'
> into devel-hourly-2020052109
> git bisect good 7f0cf9df0894951e2850ac25731c30772b7622ce  # 17:10  G
>  11     0   10  10  Merge
> 'linux-review/Jernej-Skrabec/media-cedrus-Add-support-for-additional-outp=
ut-formats/20200521-051138'
> into devel-hourly-2020052109
> git bisect good 557f799ce541fc3798225dded1060ecf6a51cd98  # 18:09  G
>  11     0   11  11  Merge
> 'linux-review/Jiri-Olsa/perf-stat-Fix-duration_time-value-for-higher-inte=
rvals/20200518-212252'
> into devel-hourly-2020052109
> git bisect  bad 200723f8cb3e8a4caabf7b771dd901751c2cb972  # 18:25  B
> 0     3   19   0  Merge
> 'linux-review/Leonardo-Bras/powerpc-crash-Use-NMI-context-for-printk-when=
-starting-to-crash/20200519-184308'
> into devel-hourly-2020052109
> git bisect good f722da7b4b3d0024055d3ea8e1abba2a08086b0a  # 19:33  G
>  10     0   10  10  Merge
> 'linux-review/Emil-Velikov/fbdev-annotate-rivafb-nvidiafb-as-obsolete/202=
00518-060957'
> into devel-hourly-2020052109
> git bisect  bad 4a9a268f023a4eb6afa9e29113c330232b9a9977  # 19:55  B
> 0     1   17   0  Merge
> 'linux-review/UPDATE-20200518-212138/Fredrik-Strupe/arm-ptrace-Fix-mask-f=
or-thumb-breakpoint-hook/20200414-045104'
> into devel-hourly-2020052109
> git bisect  bad 595b1f68f964c3864bf9762d3bb453fd12397703  # 20:15  B
> 0     1   17   0  Merge
> 'linux-review/Roopa-Prabhu/Support-for-fdb-ECMP-nexthop-groups/20200521-0=
54241'
> into devel-hourly-2020052109
> git bisect good 08c1033517c3daf5424362a6768b52d78be91bfb  # 21:09  G
>  10     0   10  10  Merge
> 'linux-review/David-Ahern/nexthop-Fix-attribute-checking-for-groups/20200=
518-012917'
> into devel-hourly-2020052109
> git bisect good 6751c122439854abfa90ad54b60c9550434d71a3  # 22:08  G
>  10     0   10  10  nexthop: add support for notifiers
> git bisect  bad fccc09644f7667e01bbfe9f31773264d1c28b394  # 22:26  B
> 0    11   27   0  selftests: net: add fdb nexthop tests
> git bisect  bad 494344d6e6e348b1866d75998efe873203a5f2e6  # 22:34  B
> 0     1   17   0  vxlan: support for nexthop notifiers
> # first bad commit: [494344d6e6e348b1866d75998efe873203a5f2e6] vxlan:
> support for nexthop notifiers
> git bisect good 6751c122439854abfa90ad54b60c9550434d71a3  # 23:27  G
>  30     0   30  41  nexthop: add support for notifiers
> # extra tests with debug options
> git bisect  bad 494344d6e6e348b1866d75998efe873203a5f2e6  # 23:40  B
> 0     3   19   0  vxlan: support for nexthop notifiers
> # extra tests on head commit of
> linux-review/Roopa-Prabhu/Support-for-fdb-ECMP-nexthop-groups/20200521-05=
4241
> git bisect  bad fccc09644f7667e01bbfe9f31773264d1c28b394  # 23:52  B
> 0    11   27   0  selftests: net: add fdb nexthop tests
> # bad: [fccc09644f7667e01bbfe9f31773264d1c28b394] selftests: net: add fdb
> nexthop tests
> # extra tests on revert first bad commit
> git bisect good a25378bb8a65fb83c85eeab8dd814b9e5f34ee0d  # 01:04  G
>  10     0   10  10  Revert "vxlan: support for nexthop notifiers"
> # good: [a25378bb8a65fb83c85eeab8dd814b9e5f34ee0d] Revert "vxlan: support
> for nexthop notifiers"
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org
>

--===============6079150830511448341==
Content-Type: text/html
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.htm"

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFNhdCwgTWF5
IDIzLCAyMDIwIGF0IDY6MzggQU0ga2VybmVsIHRlc3Qgcm9ib3QgJmx0OzxhIGhyZWY9Im1haWx0
bzpsa3BAaW50ZWwuY29tIj5sa3BAaW50ZWwuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2Pjxi
bG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAw
LjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6
MWV4Ij5HcmVldGluZ3MsPGJyPgo8YnI+CjBkYXkga2VybmVsIHRlc3Rpbmcgcm9ib3QgZ290IHRo
ZSBiZWxvdyBkbWVzZyBhbmQgdGhlIGZpcnN0IGJhZCBjb21taXQgaXM8YnI+Cjxicj4KPGEgaHJl
Zj0iaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGludXgvY29tbWl0cy9Sb29wYS1QcmFiaHUv
U3VwcG9ydC1mb3ItZmRiLUVDTVAtbmV4dGhvcC1ncm91cHMvMjAyMDA1MjEtMDU0MjQxIiByZWw9
Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dpdGh1Yi5jb20vMGRheS1jaS9s
aW51eC9jb21taXRzL1Jvb3BhLVByYWJodS9TdXBwb3J0LWZvci1mZGItRUNNUC1uZXh0aG9wLWdy
b3Vwcy8yMDIwMDUyMS0wNTQyNDE8L2E+PGJyPgo8YnI+CmNvbW1pdCA0OTQzNDRkNmU2ZTM0OGIx
ODY2ZDc1OTk4ZWZlODczMjAzYTVmMmU2PGJyPgpBdXRob3I6wqAgwqAgwqBSb29wYSBQcmFiaHUg
Jmx0OzxhIGhyZWY9Im1haWx0bzpyb29wYUBjdW11bHVzbmV0d29ya3MuY29tIiB0YXJnZXQ9Il9i
bGFuayI+cm9vcGFAY3VtdWx1c25ldHdvcmtzLmNvbTwvYT4mZ3Q7PGJyPgpBdXRob3JEYXRlOiBX
ZWQgTWF5IDIwIDExOjIzOjEwIDIwMjAgLTA3MDA8YnI+CkNvbW1pdDrCoCDCoCDCoDBkYXkgcm9i
b3QgJmx0OzxhIGhyZWY9Im1haWx0bzpsa3BAaW50ZWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+bGtw
QGludGVsLmNvbTwvYT4mZ3Q7PGJyPgpDb21taXREYXRlOiBUaHUgTWF5IDIxIDA1OjQyOjU5IDIw
MjAgKzA4MDA8YnI+Cjxicj4KwqAgwqAgdnhsYW46IHN1cHBvcnQgZm9yIG5leHRob3Agbm90aWZp
ZXJzPGJyPgo8YnI+CsKgIMKgIHZ4bGFuIGRyaXZlciByZWdpc3RlcnMgZm9yIG5leHRob3AgYWRk
L2RlbCBub3RpZmllcnMgdG88YnI+CsKgIMKgIGNsZWFudXAgZmRiIGVudHJpZXMgcG9pbnRpbmcg
dG8gc3VjaCBuZXh0aG9wcy48YnI+Cjxicj4KwqAgwqAgU2lnbmVkLW9mZi1ieTogUm9vcGEgUHJh
Ymh1ICZsdDs8YSBocmVmPSJtYWlsdG86cm9vcGFAY3VtdWx1c25ldHdvcmtzLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiPnJvb3BhQGN1bXVsdXNuZXR3b3Jrcy5jb208L2E+Jmd0Ozxicj4KPGJyPjwvYmxv
Y2txdW90ZT48ZGl2Pjxicj48L2Rpdj48ZGl2PlRoaXMgc2hvdWxkIGJlIGZpeGVkIHdpdGggbXkg
bGF0ZXIgdmVyc2lvbsKgIGluIHRoaXMgY29tbWl0LjwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cHM6
Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV0ZGV2L25ldC1uZXh0
LmdpdC9jb21taXQvP2lkPTg1OTBjZWVkYjcwMTgxYWQ5ZGU1YTNkYzJjZmU1MGNhMzNhOTU3NmEi
Pmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25ldGRldi9u
ZXQtbmV4dC5naXQvY29tbWl0Lz9pZD04NTkwY2VlZGI3MDE4MWFkOWRlNWEzZGMyY2ZlNTBjYTMz
YTk1NzZhPC9hPsKgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5Mb29rcyBMaWtlIGkgYXR0cmli
dXRlZCBrZXJuZWwgdGVzdCByb2JvdCBpbiB0aGlzIGNvbW1pdMKgIChhbmQgYWxzbyB0aGUgY292
ZXIgbGV0dGVyKSBpbnN0ZWFkOjwvZGl2PjxkaXY+PGEgaHJlZj0iaHR0cHM6Ly9naXQua2VybmVs
Lm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV0ZGV2L25ldC1uZXh0LmdpdC9jb21taXQv
P2lkPTM4NDI4ZDY4NzE5YzQ1NGQyNjljYjAzYjc3NmQ4YTRiMGFkNjYxMTEiPmh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25ldGRldi9uZXQtbmV4dC5naXQv
Y29tbWl0Lz9pZD0zODQyOGQ2ODcxOWM0NTRkMjY5Y2IwM2I3NzZkOGE0YjBhZDY2MTExPC9hPjxi
cj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pkkgd2lsbCBrZWVwIGFu
IGV5ZSBvbiBmdXJ0aGVyIHJlcG9ydHMgb24gdGhpcy48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PlRoYW5rcyEuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4KNjc1MWMxMjI0M8KgIG5leHRob3A6IGFkZCBzdXBwb3J0
IGZvciBub3RpZmllcnM8YnI+CjQ5NDM0NGQ2ZTbCoCB2eGxhbjogc3VwcG9ydCBmb3IgbmV4dGhv
cCBub3RpZmllcnM8YnI+CmZjY2MwOTY0NGbCoCBzZWxmdGVzdHM6IG5ldDogYWRkIGZkYiBuZXh0
aG9wIHRlc3RzPGJyPgorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSs8YnI+CnzCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwg
Njc1MWMxMjI0MyB8IDQ5NDM0NGQ2ZTYgfCBmY2NjMDk2NDRmIHw8YnI+CistLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0r
LS0tLS0tLS0tLS0tKzxicj4KfCBib290X3N1Y2Nlc3Nlc8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHwgMMKgIMKgIMKgIMKgIMKgIHwgMMKgIMKgIMKgIMKgIMKgIHwg
MMKgIMKgIMKgIMKgIMKgIHw8YnI+CnwgYm9vdF9mYWlsdXJlc8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfCA0NMKgIMKgIMKgIMKgIMKgfCAxMcKgIMKgIMKgIMKg
IMKgfCAxMcKgIMKgIMKgIMKgIMKgfDxicj4KfCBCVUc6a2VybmVsX3RpbWVvdXRfaW5fdGVzdF9z
dGFnZcKgIMKgIMKgIMKgIMKgIHwgNDHCoCDCoCDCoCDCoCDCoHzCoCDCoCDCoCDCoCDCoCDCoCB8
wqAgwqAgwqAgwqAgwqAgwqAgfDxicj4KfCBCVUc6a2VybmVsX3RpbWVvdXRfaW5fdG9ydHVyZV90
ZXN0X3N0YWdlwqAgfCAzwqAgwqAgwqAgwqAgwqAgfMKgIMKgIMKgIMKgIMKgIMKgIHzCoCDCoCDC
oCDCoCDCoCDCoCB8PGJyPgp8IEJVRzpzcGlubG9ja190cnlsb2NrX2ZhaWx1cmVfb25fVVBfb25f
Q1BVIHwgMMKgIMKgIMKgIMKgIMKgIHwgMTHCoCDCoCDCoCDCoCDCoHwgMTHCoCDCoCDCoCDCoCDC
oHw8YnI+CistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLSstLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tKzxicj4KPGJyPgpJZiB5b3UgZml4IHRo
ZSBpc3N1ZSwga2luZGx5IGFkZCBmb2xsb3dpbmcgdGFnPGJyPgpSZXBvcnRlZC1ieToga2VybmVs
IHRlc3Qgcm9ib3QgJmx0OzxhIGhyZWY9Im1haWx0bzpsa3BAaW50ZWwuY29tIiB0YXJnZXQ9Il9i
bGFuayI+bGtwQGludGVsLmNvbTwvYT4mZ3Q7PGJyPgo8YnI+ClvCoCDCoCA2LjIzMTQ4M13CoCDC
oCDCoG9rIDMzIC0gbGlzdF90ZXN0X2xpc3RfZm9yX2VhY2hfc2FmZTxicj4KW8KgIMKgIDYuMjMy
MTkyXcKgIMKgIMKgb2sgMzQgLSBsaXN0X3Rlc3RfbGlzdF9mb3JfZWFjaF9wcmV2X3NhZmU8YnI+
ClvCoCDCoCA2LjIzMjc0OF3CoCDCoCDCoG9rIDM1IC0gbGlzdF90ZXN0X2xpc3RfZm9yX2VhY2hf
ZW50cnk8YnI+ClvCoCDCoCA2LjIzMzQxMl3CoCDCoCDCoG9rIDM2IC0gbGlzdF90ZXN0X2xpc3Rf
Zm9yX2VhY2hfZW50cnlfcmV2ZXJzZTxicj4KW8KgIMKgIDYuMjMzODU5XSBvayAzIC0gbGlzdC1r
dW5pdC10ZXN0PGJyPgpbwqAgwqAgNi4yMzUzNzRdIEJVRzogc3BpbmxvY2sgdHJ5bG9jayBmYWls
dXJlIG9uIFVQIG9uIENQVSMwLCBzd2FwcGVyLzE8YnI+ClvCoCDCoCA2LjIzNTkyNV3CoCBsb2Nr
OiBpbml0X25ldCsweDIwNC8weGUyMCwgLm1hZ2ljOiAwMDAwMDAwMCwgLm93bmVyOiAmbHQ7bm9u
ZSZndDsvLTEsIC5vd25lcl9jcHU6IDA8YnI+ClvCoCDCoCA2LjIzNjYwMF0gQ1BVOiAwIFBJRDog
MSBDb21tOiBzd2FwcGVyIE5vdCB0YWludGVkIDUuNy4wLXJjNSAjMTxicj4KW8KgIMKgIDYuMjM3
MDg1XSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAxOTk2
KSwgQklPUyAxLjEyLjAtMSAwNC8wMS8yMDE0PGJyPgpbwqAgwqAgNi4yMzc3NzBdIENhbGwgVHJh
Y2U6PGJyPgpbwqAgwqAgNi4yMzc5ODRdwqAgZHVtcF9zdGFjaysweDMyLzB4NGE8YnI+ClvCoCDC
oCA2LjIzODI2MV3CoCBzcGluX2R1bXArMHhhZS8weDEzMDxicj4KW8KgIMKgIDYuMjM4NTQwXcKg
IGRvX3Jhd19zcGluX3RyeWxvY2srMHhhMS8weGMwPGJyPgpbwqAgwqAgNi4yMzg4ODFdwqAgX3Jh
d19zcGluX2xvY2tfaXJxc2F2ZSsweGJjLzB4MTYwPGJyPgpbwqAgwqAgNi4yMzkyNDddwqAgPyBh
dG9taWNfbm90aWZpZXJfY2hhaW5fcmVnaXN0ZXIrMHgyNC8weDcwPGJyPgpbwqAgwqAgNi4yMzk2
NzVdwqAgYXRvbWljX25vdGlmaWVyX2NoYWluX3JlZ2lzdGVyKzB4MjQvMHg3MDxicj4KW8KgIMKg
IDYuMjQwMDg5XcKgIHJlZ2lzdGVyX25leHRob3Bfbm90aWZpZXIrMHgyMC8weDMwPGJyPgpbwqAg
wqAgNi4yNDA0NjldwqAgdnhsYW5faW5pdF9uZXQrMHgyMDIvMHgzNTA8YnI+ClvCoCDCoCA2LjI0
MDc5MF3CoCBvcHNfaW5pdCsweDY1LzB4MzkwPGJyPgpbwqAgwqAgNi4yNDEwNjRdwqAgcmVnaXN0
ZXJfcGVybmV0X29wZXJhdGlvbnMrMHgxM2EvMHgyZDA8YnI+ClvCoCDCoCA2LjI0MTQ2NF3CoCA/
IHZpcnRpb19uZXRfZHJpdmVyX2luaXQrMHgxMGIvMHgxMGI8YnI+ClvCoCDCoCA2LjI0MTg2MV3C
oCByZWdpc3Rlcl9wZXJuZXRfc3Vic3lzKzB4M2QvMHg3MDxicj4KW8KgIMKgIDYuMjQyMjE3XcKg
IHZ4bGFuX2luaXRfbW9kdWxlKzB4M2UvMHhmNDxicj4KW8KgIMKgIDYuMjQyNTQyXcKgIGRvX29u
ZV9pbml0Y2FsbCsweGVmLzB4NmEwPGJyPgpbwqAgwqAgNi4yNDI4OTJdwqAgPyByY3VfcmVhZF9s
b2NrX3NjaGVkX2hlbGQrMHg1ZC8weGQwPGJyPgpbwqAgwqAgNi4yNDMyNzldwqAgPyB0cmFjZV9p
bml0Y2FsbF9sZXZlbCsweDEzMi8weDFjYzxicj4KW8KgIMKgIDYuMjQzNjU3XcKgIGRvX2luaXRj
YWxscysweDE2Yy8weDFhZDxicj4KW8KgIMKgIDYuMjQzOTY0XcKgIGtlcm5lbF9pbml0X2ZyZWVh
YmxlKzB4MWFmLzB4MjY0PGJyPgpbwqAgwqAgNi4yNDQzMjJdwqAgPyByZXN0X2luaXQrMHg0YTAv
MHg0YTA8YnI+ClvCoCDCoCA2LjI0NDYxN13CoCBrZXJuZWxfaW5pdCsweDFiLzB4MjgwPGJyPgpb
wqAgwqAgNi4yNDQ5MDZdwqAgcmV0X2Zyb21fZm9yaysweDJlLzB4NDA8YnI+ClvCoCDCoCA2LjI2
MDY1Nl0gZGVidWc6IHVubWFwcGluZyBpbml0IFttZW0gMHhjNDNjMjAwMC0weGM0NTY2ZmZmXTxi
cj4KW8KgIMKgIDYuMjY2MzU1XSBXcml0ZSBwcm90ZWN0aW5nIGtlcm5lbCB0ZXh0IGFuZCByZWFk
LW9ubHkgZGF0YTogNDY1NjhrPGJyPgpbwqAgwqAgNi4yNjY4ODZdIE5YLXByb3RlY3RpbmcgdGhl
IGtlcm5lbCBkYXRhOiAyMzcyMGs8YnI+ClvCoCDCoCA2LjI2NzgzMl0gUnVuIC9pbml0IGFzIGlu
aXQgcHJvY2Vzczxicj4KW8KgIMKgIDYuMjcxOTYxXcKgIMKgd2l0aCBhcmd1bWVudHM6PGJyPgo8
YnI+CsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICMgSEg6TU0gUkVTVUxUIEdPT0QgQkFE
IEdPT0RfQlVUX0RJUlRZIERJUlRZX05PVF9CQUQ8YnI+CmdpdCBiaXNlY3Qgc3RhcnQgMTEyM2Mw
YTJmZmExNGY0NDU1NDEwNmZmYzkyNDg4YWZkYjBmYTU3OCBiOWJiZTZlZDYzYjJiOWYyYzllZTVj
YmQwZjJjOTQ2YTI3MjNmNGNlIC0tPGJyPgpnaXQgYmlzZWN0wqAgYmFkIGE2OGRiMDEzMTM3MjBm
NzZjMDZjMzI0Yzk4ZjEwZGU3YWY4ZmU1NjTCoCAjIDE2OjEwwqAgQsKgIMKgIMKgIDDCoCDCoCDC
oDHCoCDCoDE3wqAgwqAwwqAgTWVyZ2UgJiMzOTtsaW51eC1yZXZpZXcvSHVhbmctUWlqdW4vdmxh
bi1maXgtdGhlLWJ1Zy10aGF0LWNhbm5vdC1jcmVhdGUtdmxhbjQwOTUvMjAyMDA1MTgtMTMzMDU1
JiMzOTsgaW50byBkZXZlbC1ob3VybHktMjAyMDA1MjEwOTxicj4KZ2l0IGJpc2VjdCBnb29kIDdm
MGNmOWRmMDg5NDk1MWUyODUwYWMyNTczMWMzMDc3MmI3NjIyY2XCoCAjIDE3OjEwwqAgR8KgIMKg
IMKgMTHCoCDCoCDCoDDCoCDCoDEwwqAgMTDCoCBNZXJnZSAmIzM5O2xpbnV4LXJldmlldy9KZXJu
ZWotU2tyYWJlYy9tZWRpYS1jZWRydXMtQWRkLXN1cHBvcnQtZm9yLWFkZGl0aW9uYWwtb3V0cHV0
LWZvcm1hdHMvMjAyMDA1MjEtMDUxMTM4JiMzOTsgaW50byBkZXZlbC1ob3VybHktMjAyMDA1MjEw
OTxicj4KZ2l0IGJpc2VjdCBnb29kIDU1N2Y3OTljZTU0MWZjMzc5ODIyNWRkZWQxMDYwZWNmNmE1
MWNkOTjCoCAjIDE4OjA5wqAgR8KgIMKgIMKgMTHCoCDCoCDCoDDCoCDCoDExwqAgMTHCoCBNZXJn
ZSAmIzM5O2xpbnV4LXJldmlldy9KaXJpLU9sc2EvcGVyZi1zdGF0LUZpeC1kdXJhdGlvbl90aW1l
LXZhbHVlLWZvci1oaWdoZXItaW50ZXJ2YWxzLzIwMjAwNTE4LTIxMjI1MiYjMzk7IGludG8gZGV2
ZWwtaG91cmx5LTIwMjAwNTIxMDk8YnI+CmdpdCBiaXNlY3TCoCBiYWQgMjAwNzIzZjhjYjNlOGE0
Y2FhYmY3Yjc3MWRkOTAxNzUxYzJjYjk3MsKgICMgMTg6MjXCoCBCwqAgwqAgwqAgMMKgIMKgIMKg
M8KgIMKgMTnCoCDCoDDCoCBNZXJnZSAmIzM5O2xpbnV4LXJldmlldy9MZW9uYXJkby1CcmFzL3Bv
d2VycGMtY3Jhc2gtVXNlLU5NSS1jb250ZXh0LWZvci1wcmludGstd2hlbi1zdGFydGluZy10by1j
cmFzaC8yMDIwMDUxOS0xODQzMDgmIzM5OyBpbnRvIGRldmVsLWhvdXJseS0yMDIwMDUyMTA5PGJy
PgpnaXQgYmlzZWN0IGdvb2QgZjcyMmRhN2I0YjNkMDAyNDA1NWQzZWE4ZTFhYmJhMmEwODA4NmIw
YcKgICMgMTk6MzPCoCBHwqAgwqAgwqAxMMKgIMKgIMKgMMKgIMKgMTDCoCAxMMKgIE1lcmdlICYj
Mzk7bGludXgtcmV2aWV3L0VtaWwtVmVsaWtvdi9mYmRldi1hbm5vdGF0ZS1yaXZhZmItbnZpZGlh
ZmItYXMtb2Jzb2xldGUvMjAyMDA1MTgtMDYwOTU3JiMzOTsgaW50byBkZXZlbC1ob3VybHktMjAy
MDA1MjEwOTxicj4KZ2l0IGJpc2VjdMKgIGJhZCA0YTlhMjY4ZjAyM2E0ZWI2YWZhOWUyOTExM2Mz
MzAyMzJiOWE5OTc3wqAgIyAxOTo1NcKgIELCoCDCoCDCoCAwwqAgwqAgwqAxwqAgwqAxN8KgIMKg
MMKgIE1lcmdlICYjMzk7bGludXgtcmV2aWV3L1VQREFURS0yMDIwMDUxOC0yMTIxMzgvRnJlZHJp
ay1TdHJ1cGUvYXJtLXB0cmFjZS1GaXgtbWFzay1mb3ItdGh1bWItYnJlYWtwb2ludC1ob29rLzIw
MjAwNDE0LTA0NTEwNCYjMzk7IGludG8gZGV2ZWwtaG91cmx5LTIwMjAwNTIxMDk8YnI+CmdpdCBi
aXNlY3TCoCBiYWQgNTk1YjFmNjhmOTY0YzM4NjRiZjk3NjJkM2JiNDUzZmQxMjM5NzcwM8KgICMg
MjA6MTXCoCBCwqAgwqAgwqAgMMKgIMKgIMKgMcKgIMKgMTfCoCDCoDDCoCBNZXJnZSAmIzM5O2xp
bnV4LXJldmlldy9Sb29wYS1QcmFiaHUvU3VwcG9ydC1mb3ItZmRiLUVDTVAtbmV4dGhvcC1ncm91
cHMvMjAyMDA1MjEtMDU0MjQxJiMzOTsgaW50byBkZXZlbC1ob3VybHktMjAyMDA1MjEwOTxicj4K
Z2l0IGJpc2VjdCBnb29kIDA4YzEwMzM1MTdjM2RhZjU0MjQzNjJhNjc2OGI1MmQ3OGJlOTFiZmLC
oCAjIDIxOjA5wqAgR8KgIMKgIMKgMTDCoCDCoCDCoDDCoCDCoDEwwqAgMTDCoCBNZXJnZSAmIzM5
O2xpbnV4LXJldmlldy9EYXZpZC1BaGVybi9uZXh0aG9wLUZpeC1hdHRyaWJ1dGUtY2hlY2tpbmct
Zm9yLWdyb3Vwcy8yMDIwMDUxOC0wMTI5MTcmIzM5OyBpbnRvIGRldmVsLWhvdXJseS0yMDIwMDUy
MTA5PGJyPgpnaXQgYmlzZWN0IGdvb2QgNjc1MWMxMjI0Mzk4NTRhYmZhOTBhZDU0YjYwYzk1NTA0
MzRkNzFhM8KgICMgMjI6MDjCoCBHwqAgwqAgwqAxMMKgIMKgIMKgMMKgIMKgMTDCoCAxMMKgIG5l
eHRob3A6IGFkZCBzdXBwb3J0IGZvciBub3RpZmllcnM8YnI+CmdpdCBiaXNlY3TCoCBiYWQgZmNj
YzA5NjQ0Zjc2NjdlMDFiYmZlOWYzMTc3MzI2NGQxYzI4YjM5NMKgICMgMjI6MjbCoCBCwqAgwqAg
wqAgMMKgIMKgIDExwqAgwqAyN8KgIMKgMMKgIHNlbGZ0ZXN0czogbmV0OiBhZGQgZmRiIG5leHRo
b3AgdGVzdHM8YnI+CmdpdCBiaXNlY3TCoCBiYWQgNDk0MzQ0ZDZlNmUzNDhiMTg2NmQ3NTk5OGVm
ZTg3MzIwM2E1ZjJlNsKgICMgMjI6MzTCoCBCwqAgwqAgwqAgMMKgIMKgIMKgMcKgIMKgMTfCoCDC
oDDCoCB2eGxhbjogc3VwcG9ydCBmb3IgbmV4dGhvcCBub3RpZmllcnM8YnI+CiMgZmlyc3QgYmFk
IGNvbW1pdDogWzQ5NDM0NGQ2ZTZlMzQ4YjE4NjZkNzU5OThlZmU4NzMyMDNhNWYyZTZdIHZ4bGFu
OiBzdXBwb3J0IGZvciBuZXh0aG9wIG5vdGlmaWVyczxicj4KZ2l0IGJpc2VjdCBnb29kIDY3NTFj
MTIyNDM5ODU0YWJmYTkwYWQ1NGI2MGM5NTUwNDM0ZDcxYTPCoCAjIDIzOjI3wqAgR8KgIMKgIMKg
MzDCoCDCoCDCoDDCoCDCoDMwwqAgNDHCoCBuZXh0aG9wOiBhZGQgc3VwcG9ydCBmb3Igbm90aWZp
ZXJzPGJyPgojIGV4dHJhIHRlc3RzIHdpdGggZGVidWcgb3B0aW9uczxicj4KZ2l0IGJpc2VjdMKg
IGJhZCA0OTQzNDRkNmU2ZTM0OGIxODY2ZDc1OTk4ZWZlODczMjAzYTVmMmU2wqAgIyAyMzo0MMKg
IELCoCDCoCDCoCAwwqAgwqAgwqAzwqAgwqAxOcKgIMKgMMKgIHZ4bGFuOiBzdXBwb3J0IGZvciBu
ZXh0aG9wIG5vdGlmaWVyczxicj4KIyBleHRyYSB0ZXN0cyBvbiBoZWFkIGNvbW1pdCBvZiBsaW51
eC1yZXZpZXcvUm9vcGEtUHJhYmh1L1N1cHBvcnQtZm9yLWZkYi1FQ01QLW5leHRob3AtZ3JvdXBz
LzIwMjAwNTIxLTA1NDI0MTxicj4KZ2l0IGJpc2VjdMKgIGJhZCBmY2NjMDk2NDRmNzY2N2UwMWJi
ZmU5ZjMxNzczMjY0ZDFjMjhiMzk0wqAgIyAyMzo1MsKgIELCoCDCoCDCoCAwwqAgwqAgMTHCoCDC
oDI3wqAgwqAwwqAgc2VsZnRlc3RzOiBuZXQ6IGFkZCBmZGIgbmV4dGhvcCB0ZXN0czxicj4KIyBi
YWQ6IFtmY2NjMDk2NDRmNzY2N2UwMWJiZmU5ZjMxNzczMjY0ZDFjMjhiMzk0XSBzZWxmdGVzdHM6
IG5ldDogYWRkIGZkYiBuZXh0aG9wIHRlc3RzPGJyPgojIGV4dHJhIHRlc3RzIG9uIHJldmVydCBm
aXJzdCBiYWQgY29tbWl0PGJyPgpnaXQgYmlzZWN0IGdvb2QgYTI1Mzc4YmI4YTY1ZmI4M2M4NWVl
YWI4ZGQ4MTRiOWU1ZjM0ZWUwZMKgICMgMDE6MDTCoCBHwqAgwqAgwqAxMMKgIMKgIMKgMMKgIMKg
MTDCoCAxMMKgIFJldmVydCAmcXVvdDt2eGxhbjogc3VwcG9ydCBmb3IgbmV4dGhvcCBub3RpZmll
cnMmcXVvdDs8YnI+CiMgZ29vZDogW2EyNTM3OGJiOGE2NWZiODNjODVlZWFiOGRkODE0YjllNWYz
NGVlMGRdIFJldmVydCAmcXVvdDt2eGxhbjogc3VwcG9ydCBmb3IgbmV4dGhvcCBub3RpZmllcnMm
cXVvdDs8YnI+Cjxicj4KLS0tPGJyPgowLURBWSBDSSBLZXJuZWwgVGVzdCBTZXJ2aWNlLCBJbnRl
bCBDb3Jwb3JhdGlvbjxicj4KPGEgaHJlZj0iaHR0cHM6Ly9saXN0cy4wMS5vcmcvaHlwZXJraXR0
eS9saXN0L2xrcEBsaXN0cy4wMS5vcmciIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsi
Pmh0dHBzOi8vbGlzdHMuMDEub3JnL2h5cGVya2l0dHkvbGlzdC9sa3BAbGlzdHMuMDEub3JnPC9h
Pjxicj4KPC9ibG9ja3F1b3RlPjwvZGl2PjwvZGl2Pgo=

--===============6079150830511448341==--

