Content-Type: multipart/mixed; boundary="===============1515222914885531714=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86/MCE] 81aa021b8c: WARNING: CPU: 0 PID: 0 at arch/x86/kernel/cpu/mcheck/mce.c:716 machine_check_poll+0x66/0x21c
Date: Thu, 10 Nov 2016 13:46:34 +0100
Message-ID: <20161110124633.3fv4mc4kxvdxmnzj@pd.tnic>
In-Reply-To: <582469b2.PLOtWbwTF/l9zaTD%xiaolong.ye@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1515222914885531714==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 10, 2016 at 08:36:02PM +0800, kernel test robot wrote:
> FYI, we noticed the following commit:
> =

> https://github.com/0day-ci/linux Borislav-Petkov/x86-MCE-Correct-TSC-time=
stamping-of-error-records/20161110-021431
> commit 81aa021b8c6f464b68c6e6df93e64ffe2c2adda6 ("x86/MCE: Remove MCP_TIM=
ESTAMP")
> =

> in testcase: boot
> =

> on test machine: qemu-system-x86_64 -enable-kvm -m 320M
> =

> caused below changes:
> =

> =

> +-----------------------------------------------------------------+------=
------+------------+
> |                                                                 | b2eca=
63145 | 81aa021b8c |
> +-----------------------------------------------------------------+------=
------+------------+
> | boot_successes                                                  | 16   =
      | 0          |
> | boot_failures                                                   | 0    =
      | 10         |
> | WARNING:at_arch/x86/kernel/cpu/mcheck/mce.c:#machine_check_poll | 0    =
      | 10         |
> +-----------------------------------------------------------------+------=
------+------------+
> =

> =

> =

> [    0.238462] Mountpoint-cache hash table entries: 1024 (order: 1, 8192 =
bytes)
> [    0.240536] mce: CPU supports 10 MCE banks
> [    0.241403] ------------[ cut here ]------------
> [    0.242334] WARNING: CPU: 0 PID: 0 at arch/x86/kernel/cpu/mcheck/mce.c=
:716 machine_check_poll+0x66/0x21c
> [    0.244554] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.9.0-rc4-00300-=
g81aa021 #64
> [    0.246089] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S Debian-1.8.2-1 04/01/2014
> [    0.247857] Call Trace:
> [    0.248341]  dump_stack+0x61/0x7e
> [    0.249018]  __warn+0xb3/0xce
> [    0.249594]  warn_slowpath_null+0x18/0x1a

Thanks guys, this actually helps!

I'll remove the WARN_ON_ONCE as it confirms a theory we had.

-- =

Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.

--===============1515222914885531714==--

