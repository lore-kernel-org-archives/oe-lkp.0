Content-Type: multipart/mixed; boundary="===============2230236812896947155=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [i2c: dev] d6760b14d4: BUG: KASAN: slab-out-of-bounds in of_device_uevent at addr ffff8800091b4c49
Date: Sat, 28 May 2016 18:14:08 +0800
Message-ID: <20160528101408.GA4346@wfg-t540p.sh.intel.com>
In-Reply-To: <20160528073217.GB1714@katana>
List-Id: <oe-lkp.lists.linux.dev>

--===============2230236812896947155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, May 28, 2016 at 09:32:17AM +0200, Wolfram Sang wrote:
> =

> > There will be simple boot tests quickly after the compile tests.
> > However boot tests typically need more time to be detected, bisected
> > and especially manual checked. We are yet to automate more boot error
> > reports.
> =

> Thanks for the heads up. Could there be success mails for boot tests,
> too?

That may be too noisy to be useful. Boot errors may not be well
reproducible, may take different forms, and the base trees are
typically not clean -- even mainline tree has regular errors, for
example, here are the runtime error ids in kernel v4.6 with kconfig
x86_64-rhel:

boot_successes: 1470
boot_failures: 154
BUG:sleeping_function_called_from_invalid_context_at_kernel/irq/manage.c: 1=
02
WARNING:at_drivers/gpu/drm/i915/intel_display.c:#intel_modeset_init[i915]: 4
drm:fw_domains_get[i915]]: 57
drm:__gen6_gt_wait_for_thread_c0[i915]]: 57
BUG:kernel_test_crashed: 4
invoked_oom-killer:gfp_mask=3D0x: 22
Mem-Info: 22
Kernel_panic-not_syncing:Out_of_memory_and_no_killable_processes: 18
invalid_opcode:#[##]SMP: 3
RIP:ftrace_stub: 16
Kernel_panic-not_syncing:Fatal_exception: 16
BUG:unable_to_handle_kernel: 13
Oops: 13
Out_of_memory:Kill_process: 4

However if you are still interested, we can try composing auto runtime
test report emails.

Thanks,
Fengguang

--===============2230236812896947155==--

