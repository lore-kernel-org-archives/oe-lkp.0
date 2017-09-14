Content-Type: multipart/mixed; boundary="===============8667274194796498964=="
MIME-Version: 1.0
From: Prarit Bhargava <prarit@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/topology] 05aa90edc7: kernel_BUG_at_arch/x86/kernel/cpu/common.c
Date: Thu, 14 Sep 2017 13:25:27 -0400
Message-ID: <79fb7f24-caac-2da6-92bf-dfffaa905ee3@redhat.com>
In-Reply-To: <20170911234651.64p6yxmnzthsbpia@inn>
List-Id: <oe-lkp.lists.linux.dev>

--===============8667274194796498964==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/11/2017 07:46 PM, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> commit: 05aa90edc7910ec3d1ed791fa77371b3acb9bf08 ("x86/topology: Avoid wa=
sting 128k for package id array")
> url: https://github.com/0day-ci/linux/commits/Andi-Kleen/perf-x86-intel-u=
ncore-Cache-logical-pkg-id-in-uncore-driver/20170910-025322

After a bunch of mucking around and realizing that this was happened against
Andi's original patchset and not the version I had sent out, I was able to
reproduce the failure below.

> =

> =

> =

> [  277.992221] kernel BUG at arch/x86/kernel/cpu/common.c:1061!
> [  277.993885] invalid opcode: 0000 [#1] SMP
> [  277.994707] Modules linked in:
> [  277.995237] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.13.0-00002-g05=
aa90ed #26
> [  277.996567] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.9.3-20161025_171302-gandalf 04/01/2014
> [  277.998765] task: ffff9b2555034300 task.stack: ffffabde018f0000
> [  278.000063] RIP: 0010:identify_secondary_cpu+0x6a/0x71
> [  278.001055] RSP: 0000:ffffabde018f3f10 EFLAGS: 00010086
> [  278.001699] RAX: 00000000ffffffe4 RBX: ffff9b255f40a100 RCX: 000000000=
0000007
> [  278.002621] RDX: 0000000000000000 RSI: ffffffff8c13baf7 RDI: ffff9b255=
f5ce040
> [  278.003674] RBP: ffffabde018f3f20 R08: 00000049c6d945a5 R09: 000000000=
0000001
> [  278.005029] R10: 0000000000000000 R11: ffffffff90a8af67 R12: 000000000=
0000001
> [  278.006221] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [  278.007529] FS:  0000000000000000(0000) GS:ffff9b255f400000(0000) knlG=
S:0000000000000000
> [  278.009384] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  278.010798] CR2: 0000000000000000 CR3: 00000001b222c000 CR4: 000000000=
00006e0
> [  278.012134] Call Trace:
> [  278.012458]  smp_store_cpu_info+0x3e/0x40
> [  278.013008]  start_secondary+0x2f/0xe5
> [  278.013538]  secondary_startup_64+0x9f/0x9f
> [  278.014083] Code: 0f b7 8b d4 00 00 00 89 c2 44 89 e6 48 c7 c7 19 1f c=
3 8e e8 55 7c 0b 00 0f b7 bb da 00 00 00 44 89 e6 e8 f9 df 00 00 85 c0 74 0=
2 <0f> 0b 5b 41 5c 5d c3 55 48 89 e5 41 54 53 80 7f 01 08 48 89 fb =

> [  278.017392] RIP: identify_secondary_cpu+0x6a/0x71 RSP: ffffabde018f3f10
> [  278.018303] ---[ end trace 791e5b1aeb0d5a6c ]---
> =


This happens in the following situation.  Suppose you a have 2 package, 1 c=
ore,
1 thread system.  After system boot the number of logical_packages =3D 2.

A socket is down'd.  The number of logical_packages is still 2.

The socket is brought back into service.  topology_update_package_map() is
called.  Because these are single thread sockets there is no mapping between
this package and a logical package #.

Therefore topology_phys_to_logical_pkg() returns -1 ... and the number of
logical_packages is increased to 3.

Everytime a socket is down'd and up'd the logical_packages value increases =
by
one, and eventually overflows.

Andi -- I can add this to your patch if you're okay with it.

(sorry for the cut-and-paste)

diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 0c6fc1ca2e94..ec6c161614f4 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -288,6 +288,7 @@ int topology_update_package_map(unsigned int pkg, unsig=
ned i
                goto found;

        new =3D logical_packages++;
+       pr_debug("logical_packages is increased to %d\n", logical_packages);
        if (new !=3D pkg) {
                pr_info("CPU %u Converting physical %u to logical package %=
u\n",
                        cpu, pkg, new);
@@ -1455,7 +1456,7 @@ static void recompute_smt_state(void)

 static void remove_siblinginfo(int cpu)
 {
-       int sibling;
+       int phys_pkg_id, sibling;
        struct cpuinfo_x86 *c =3D &cpu_data(cpu);

        for_each_cpu(sibling, topology_core_cpumask(cpu)) {
@@ -1476,6 +1477,16 @@ static void remove_siblinginfo(int cpu)
        cpumask_clear(topology_core_cpumask(cpu));
        c->phys_proc_id =3D 0;
        c->cpu_core_id =3D 0;
+
+       /* last core in socket going down? */
+       phys_pkg_id =3D c->phys_pkg_id;
+       c->phys_pkg_id =3D U16_MAX;
+       if (topology_phys_to_logical_pkg(phys_pkg_id) < 0) {
+               logical_packages--;
+               pr_debug("logical_packages is decreased to %d\n",
+                        logical_packages);
+       }
+
        cpumask_clear_cpu(cpu, cpu_sibling_setup_mask);
        recompute_smt_state();
 }

--===============8667274194796498964==--

