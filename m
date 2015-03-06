Content-Type: multipart/mixed; boundary="===============3550162811119387800=="
MIME-Version: 1.0
From: Vladimir Davydov <vdavydov@parallels.com>
To: lkp@lists.01.org
Subject: Re: [cgroup] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/cpu/common.c:1439 warn_pre_alternatives()
Date: Fri, 06 Mar 2015 09:09:37 +0300
Message-ID: <20150306060937.GC4762@esperanza>
In-Reply-To: <20150306055758.GA28187@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3550162811119387800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

This bug should have been fixed by "[PATCH -next] cpuset: initialize
cpuset a bit early":

http://www.spinics.net/lists/cgroups/msg12599.html

Thanks,
Vladimir

On Fri, Mar 06, 2015 at 01:57:58PM +0800, Fengguang Wu wrote:
> [    0.021989] ------------[ cut here ]------------
> [    0.021989] ------------[ cut here ]------------
> [    0.022816] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/cpu/common.c:143=
9 warn_pre_alternatives+0x25/0x2e()
> [    0.022816] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/cpu/common.c:143=
9 warn_pre_alternatives+0x25/0x2e()
> [    0.024000] You're using static_cpu_has before alternatives have run!
> [    0.024000] You're using static_cpu_has before alternatives have run!
> [    0.024000] Modules linked in:
> [    0.024000] Modules linked in:
> =

> [    0.024000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.0.0-rc1-00004-=
g295458e #455
> [    0.024000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.0.0-rc1-00004-=
g295458e #455
> [    0.024000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    0.024000] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.7.5-20140531_083030-gandalf 04/01/2014
> [    0.024000]  0000000000000009
> [    0.024000]  0000000000000009 ffffffff81e03cc8 ffffffff81e03cc8 ffffff=
ff81674d02 ffffffff81674d02 ffffffff810ca88e ffffffff810ca88e
> =

> [    0.024000]  ffffffff81e03d18
> [    0.024000]  ffffffff81e03d18 ffffffff81e03d08 ffffffff81e03d08 ffffff=
ff81073d6f ffffffff81073d6f 0000000000000000 0000000000000000
> =

> [    0.024000]  ffffffff81018f79
> [    0.024000]  ffffffff81018f79 ffffffff81e03e38 ffffffff81e03e38 000000=
0000000000 0000000000000000 0000000000000002 0000000000000002
> =

> [    0.024000] Call Trace:
> [    0.024000] Call Trace:
> [    0.024000]  [<ffffffff81674d02>] dump_stack+0xa0/0xd5
> [    0.024000]  [<ffffffff81674d02>] dump_stack+0xa0/0xd5
> [    0.024000]  [<ffffffff810ca88e>] ? console_unlock+0x496/0x4ef
> [    0.024000]  [<ffffffff810ca88e>] ? console_unlock+0x496/0x4ef
> [    0.024000]  [<ffffffff81073d6f>] warn_slowpath_common+0xc8/0xf7
> [    0.024000]  [<ffffffff81073d6f>] warn_slowpath_common+0xc8/0xf7
> [    0.024000]  [<ffffffff81018f79>] ? warn_pre_alternatives+0x25/0x2e
> [    0.024000]  [<ffffffff81018f79>] ? warn_pre_alternatives+0x25/0x2e
> [    0.024000]  [<ffffffff81073e6a>] warn_slowpath_fmt+0x4f/0x58
> [    0.024000]  [<ffffffff81073e6a>] warn_slowpath_fmt+0x4f/0x58
> [    0.024000]  [<ffffffff81680f47>] ? native_iret+0x7/0x7
> [    0.024000]  [<ffffffff81680f47>] ? native_iret+0x7/0x7
> [    0.024000]  [<ffffffff81018f79>] warn_pre_alternatives+0x25/0x2e
> [    0.024000]  [<ffffffff81018f79>] warn_pre_alternatives+0x25/0x2e
> [    0.024000]  [<ffffffff81039306>] __do_page_fault+0x2b4/0x7c2
> [    0.024000]  [<ffffffff81039306>] __do_page_fault+0x2b4/0x7c2
> [    0.024000]  [<ffffffff81039852>] do_page_fault+0x3e/0x4a
> [    0.024000]  [<ffffffff81039852>] do_page_fault+0x3e/0x4a
> [    0.024000]  [<ffffffff81034109>] do_async_page_fault+0x3a/0xb9
> [    0.024000]  [<ffffffff81034109>] do_async_page_fault+0x3a/0xb9
> [    0.024000]  [<ffffffff81681a28>] async_page_fault+0x28/0x30
> [    0.024000]  [<ffffffff81681a28>] async_page_fault+0x28/0x30
> [    0.024000]  [<ffffffff8110d870>] ? cpumask_copy+0x2c/0x2f
> [    0.024000]  [<ffffffff8110d870>] ? cpumask_copy+0x2c/0x2f
> [    0.024000]  [<ffffffff8110e174>] ? cpuset_bind+0x5b/0xc4
> [    0.024000]  [<ffffffff8110e174>] ? cpuset_bind+0x5b/0xc4
> [    0.024000]  [<ffffffff8234d780>] cgroup_init+0x2fa/0x3d3
> [    0.024000]  [<ffffffff8234d780>] cgroup_init+0x2fa/0x3d3
> [    0.024000]  [<ffffffff8232f5fe>] start_kernel+0x6ed/0x755
> [    0.024000]  [<ffffffff8232f5fe>] start_kernel+0x6ed/0x755
> [    0.024000]  [<ffffffff8232e120>] ? early_idt_handlers+0x120/0x120
> [    0.024000]  [<ffffffff8232e120>] ? early_idt_handlers+0x120/0x120
> [    0.024000]  [<ffffffff8232e585>] x86_64_start_reservations+0x46/0x4f
> [    0.024000]  [<ffffffff8232e585>] x86_64_start_reservations+0x46/0x4f
> [    0.024000]  [<ffffffff8232e73e>] x86_64_start_kernel+0x1b0/0x1c6
> [    0.024000]  [<ffffffff8232e73e>] x86_64_start_kernel+0x1b0/0x1c6
> [    0.024000] ---[ end trace 37d9a871c47a31bc ]---
> [    0.024000] ---[ end trace 37d9a871c47a31bc ]---

--===============3550162811119387800==--

