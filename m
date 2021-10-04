Content-Type: multipart/mixed; boundary="===============1374914067596413126=="
MIME-Version: 1.0
From: Doug Anderson <dianders@chromium.org>
To: lkp@lists.01.org
Subject: Re: [drm/edid] bac9c29482: Oops:#[##]
Date: Mon, 04 Oct 2021 09:23:51 -0700
Message-ID: <CAD=FV=W5qpV4Wb3EUB+9d4xtvx_rbhP=V5++8-6i1d6FZSa2PQ@mail.gmail.com>
In-Reply-To: <20211003142210.GD30759@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1374914067596413126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Oct 3, 2021 at 7:02 AM kernel test robot <oliver.sang@intel.com> =
wrote:
>
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: bac9c29482248b00cccfdfef1f34175714d33370 ("drm/edid: Break out re=
ading block 0 of the EDID")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>
>
> in testcase: fio-basic
> version: fio-x86_64-3.15-1_20210828
> with following parameters:
>
>         runtime: 300s
>         disk: 1HDD
>         fs: btrfs
>         nr_task: 100%
>         test_size: 128G
>         rw: write
>         bs: 4k
>         ioengine: filecreate
>         cpufreq_governor: performance
>         ucode: 0x42e
>
> test-description: Fio is a tool that will spawn a number of threads or pr=
ocesses doing a particular type of I/O action as specified by the user.
> test-url: https://github.com/axboe/fio
>
>
> on test machine: 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2 @ 2=
.70GHz with 112G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> 39mKernel Config[   14.138938][  T304] ata6: SATA max UDMA/133 abar m2048=
(a)0xd0b00000 port 0xd0b00380 irq 61
> [[   14.198770][  T635] ipmi_si dmi-ipmi-si.0: IPMI kcs interface initial=
ized
> [   14.332374][    T5] #PF: supervisor read access in kernel mode
> [   14.338904][    T5] #PF: error_code(0x0000) - not-present page
> [   14.345414][    T5] PGD 0 P4D 0
> [   14.349018][    T5] Oops: 0000 [#1] SMP PTI
> r to synchronize[   14.353687][    T5] CPU: 0 PID: 5 Comm: kworker/0:0 No=
t tainted 5.15.0-rc1-00114-gbac9c2948224 #1
> [   14.365136][    T5] Hardware name: Intel Corporation S2600WP/S2600WP, =
BIOS SE5C600.86B.02.02.0002.122320131210 12/23/2013
>  boot up for ifu[   14.377368][    T5] Workqueue: events work_for_cpu_fn
> [   14.384541][    T5] RIP: 0010:connector_bad_edid+0x12/0x180 [drm]
> [   14.391370][    T5] Code: 0f 1f 84 00 00 00 00 00 66 66 2e 0f 1f 84 00=
 00 00 00 00 0f 1f 44 00 00 0f 1f 44 00 00 41 54 55 89 d5 53 48 89 f3 48 83=
 ec 20 <0f> b6 56 7e 65 48 8b 04 25 28 00 00 00 48 89 44 24 18 31 c0 c1 e2
> [   14.414456][    T5] RSP: 0018:ffffc90000093b58 EFLAGS: 00010282
> [   14.421077][    T5] RAX: ffff888172c5df01 RBX: ffffffffffffffea RCX: 0=
0000000000003f9
> [   14.429823][    T5] RDX: 0000000000000001 RSI: ffffffffffffffea RDI: f=
fff8881e02b6668
> [   14.438567][    T5] RBP: 0000000000000001 R08: 00000a77fb35e0ea R09: 0=
000000000000000
> [   14.447321][    T5] R10: 00000000000000e9 R11: 00000000000191e4 R12: f=
fffffffc03b5d80
> [   14.456060][    T5] R13: ffff8881e02bf800 R14: 0000000000000000 R15: f=
fffffffffffffea
>          Startin[   14.464807][    T5] FS:  0000000000000000(0000) GS:fff=
f888f03600000(0000) knlGS:0000000000000000
> [   14.476158][    T5] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  Journal to Pers[   14.476160][    T5] CR2: 0000000000000068 CR3: 0000000=
2adcbe002 CR4: 00000000001706f0
> [   14.476167][    T5]  ? drm_hdmi_avi_infoframe_bars+0x40/0x40 [drm]
> 0m...
> [   14.476180][    T5]  ? drm_hdmi_avi_infoframe_bars+0x40/0x40 [drm]
> [   14.476190][    T5]  drm_do_get_edid+0xf4/0x300 [drm]
> [   14.491802][  T738] ata6: SATA link down (SStatus 0 SControl 300)

I will assume that this is the same problem reported by Geert [1].
I've posted a fix [2].

[1] https://lore.kernel.org/r/CAMuHMdWy+aASNevg8nc9LTvR9QNrGYZQnB3sYYLDRfEU=
1w_idg(a)mail.gmail.com
[2] https://lore.kernel.org/r/20211004092100.1.Ic90a5ebd44c75db963112be167a=
03cc96f9fb249(a)changeid/
--===============1374914067596413126==--

