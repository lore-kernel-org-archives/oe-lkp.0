Content-Type: multipart/mixed; boundary="===============4643065776125691298=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [arch_copy_kprobe] WARNING: CPU: 0 PID: 1 at mm/vmalloc.c:301 vmalloc_to_page+0x2bf/0x416
Date: Fri, 01 Dec 2017 11:08:49 +0900
Message-ID: <20171201110849.20dd3cc4166ef74704456741@kernel.org>
In-Reply-To: <20171130132444.loxrcfaeaxvwjgnz@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4643065776125691298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 30 Nov 2017 21:24:44 +0800
Fengguang Wu <fengguang.wu@intel.com> wrote:

> Hello,
> =

> FYI this happens in mainline kernel 4.15.0-rc1.
> It looks like a new regression. Bisect is on the way.
> =

> It occurs in 2 out of 11 boots.
> =

> [    5.083644] rcu-perf:--- Start of test: nreaders=3D0 nwriters=3D1 verb=
ose=3D1 shutdown=3D1
> [    5.085168] rcu-torture: Creating rcu_perf_shutdown task
> [    5.092218] rcu-torture: Creating rcu_perf_writer task
> [    5.093360] rcu-perf: rcu_perf_writer task started
> [    5.099058] Kprobe smoke test: started
> [    5.101137] WARNING: CPU: 0 PID: 1 at mm/vmalloc.c:301 vmalloc_to_page=
+0x2bf/0x416:
> 						vmalloc_to_page at mm/vmalloc.c:301

OK, this seems core_kernel_text() issue, since this test must call virt_to_=
page
for core-kernel text, but it calls vmalloc_to_page (as for modules). =


        if (!core_kernel_text((unsigned long)addr)) {
                pages[0] =3D vmalloc_to_page(addr);
                pages[1] =3D vmalloc_to_page(addr + PAGE_SIZE);
        } else {
                pages[0] =3D virt_to_page(addr);
                WARN_ON(!PageReserved(pages[0]));
                pages[1] =3D virt_to_page(addr + PAGE_SIZE);
        }


> [    5.102564] Modules linked in:
> [    5.103087] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.15.0-rc1 #189
> [    5.104031] task: ffff88001d068000 task.stack: ffff88001d06c000
> [    5.104031] RIP: 0010:vmalloc_to_page+0x2bf/0x416:
> 						vmalloc_to_page at mm/vmalloc.c:301
> [    5.104031] RSP: 0000:ffff88001d06fce8 EFLAGS: 00010293
> [    5.104031] RAX: 0000000000000003 RBX: ffffffffc0200000 RCX: 000000000=
0000000
> [    5.104031] RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffffffff9=
ed6e210
> [    5.104031] RBP: ffff880018815008 R08: ffffffff9e344ec6 R09: 000000000=
0000001
> [    5.104031] R10: ffff88001d06fc90 R11: 0000000000000b2c R12: 000000000=
0000000
> [    5.104031] R13: 0000000000000063 R14: 0000000000000001 R15: ffff88001=
d06fd61
> [    5.104031] FS:  0000000000000000(0000) GS:ffff88001d600000(0000) knlG=
S:0000000000000000
> [    5.104031] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    5.104031] CR2: 0000000000000000 CR3: 0000000018812000 CR4: 000000000=
00406f0
> [    5.104031] Call Trace:
> [    5.104031]  ? 0xffffffffc01ff000
> [    5.104031]  text_poke+0x4f/0x297:
> 						text_poke at arch/x86/kernel/alternative.c:709
> [    5.104031]  ? 0xffffffffc01ff002
> [    5.104031]  arch_copy_kprobe+0xf7/0x106:
> 						arch_copy_kprobe at arch/x86/kernel/kprobes/core.c:474
> [    5.104031]  arch_prepare_kprobe+0x8c/0xc4:
> 						arch_prepare_kprobe at arch/x86/kernel/kprobes/core.c:491
> [    5.104031]  register_kprobe+0x6a8/0x875:
> 						register_kprobe at kernel/kprobes.c:1567
> [    5.104031]  ? do_early_param+0xb6/0xb6:
> 						repair_env_string at init/main.c:245
> [    5.104031]  ? init_test_probes+0x49/0x4bb:
> 						test_kprobe at kernel/test_kprobes.c:69
> 						 (inlined by) init_test_probes at kernel/test_kprobes.c:377

----
static struct kprobe kp =3D {
        .symbol_name =3D "kprobe_target",
        .pre_handler =3D kp_pre_handler,
        .post_handler =3D kp_post_handler
};

static int test_kprobe(void)
{
        int ret;

        ret =3D register_kprobe(&kp); <-- here.
----
In System.map (I rebuild kernel with attached kconfig)

----
ffffffff81000000 T _stext
[..]
ffffffff8118ed1a T stop_machine_from_inactive_cpu
ffffffff8118ee77 t kprobe_target
ffffffff8118ee83 t kprobe_target2
ffffffff8118ee91 t kp_pre_handler2
[..]
ffffffff81969409 T _etext
----

So this function must be in core-kernel-text. Hmm....



> [    5.104031]  init_test_probes+0x49/0x4bb:
> 						test_kprobe at kernel/test_kprobes.c:69
> 						 (inlined by) init_test_probes at kernel/test_kprobes.c:377
> [    5.104031]  init_kprobes+0x276/0x281:
> 						init_kprobes at kernel/kprobes.c:2277
> [    5.104031]  ? debugfs_kprobe_init+0xf7/0xf7:
> 						init_kprobes at kernel/kprobes.c:2225
> [    5.104031]  do_one_initcall+0x99/0x1a0:
> 						do_one_initcall at init/main.c:826
> [    5.104031]  ? do_early_param+0xb6/0xb6:
> 						repair_env_string at init/main.c:245
> [    5.104031]  kernel_init_freeable+0x11e/0x1e8:
> 						do_initcall_level at init/main.c:891
> 						 (inlined by) do_initcalls at init/main.c:900
> 						 (inlined by) do_basic_setup at init/main.c:918
> 						 (inlined by) kernel_init_freeable at init/main.c:1066
> [    5.104031]  ? rest_init+0x270/0x270:
> 						kernel_init at init/main.c:993
> [    5.104031]  kernel_init+0x5/0x156:
> 						kernel_init at init/main.c:995
> [    5.104031]  ret_from_fork+0x24/0x30:
> 						ret_from_fork at arch/x86/entry/entry_64.S:447
> [    5.104031] Code: 9e 48 39 c8 49 89 c4 41 0f 95 c6 31 c9 31 d2 44 89 f=
6 e8 36 48 f3 ff 49 63 c6 48 83 c0 02 48 ff 04 c5 c8 3b f0 9e 4d 39 ec 74 0=
2 <0f> ff 31 d2 31 c9 48 c7 c7 e0 e1 d6 9e 44 89 f6 e8 0d 48 f3 ff
> [    5.104031] ---[ end trace 1e069188d28709ac ]---
> [    5.193423] Kprobe smoke test: passed successfully
> =

> Attached the full dmesg, kconfig and reproduce scripts.
> =

> Thanks,
> Fengguang


-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============4643065776125691298==--

