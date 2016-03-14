Content-Type: multipart/mixed; boundary="===============6216185578532605808=="
MIME-Version: 1.0
From: Ville Syrjälä <ville.syrjala@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [drm/i915] 0bbca274a3: 3.6% piglit.time.elapsed_time
Date: Mon, 14 Mar 2016 15:37:51 +0200
Message-ID: <20160314133751.GM4329@intel.com>
In-Reply-To: <20160314021437.GA32210@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6216185578532605808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 14, 2016 at 10:14:37AM +0800, kernel test robot wrote:
> FYI, we noticed that piglit.time.elapsed_time 3.6% regression on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 0bbca274a31c2366414d8d3f95e03d1c4674d93f ("drm/i915: Actually retr=
y with bit-banging after GMBUS timeout")

Increase in system time is somewhat expected, since we'll do more
bit banging now. Any chance of comparison against bffce907d640^
aka. 0aeb904888f5 ("drm/i915: simplify gmbus xfer error checks") ?
I would hope that the result would be more or less the same as with
0bbca274a31c ("drm/i915: Actually retry with bit-banging after GMBUS timeou=
t")

> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/group/kconfig/rootfs/tbox_group/testcase:
>   gcc-4.9/igt-039/x86_64-rhel/debian-x86_64-2015-02-07.cgz/snb-black/pigl=
it
> =

> commit: =

>   2f791908a70e95768596f5bb9e6de4f441d7bf13
>   0bbca274a31c2366414d8d3f95e03d1c4674d93f
> =

> 2f791908a70e9576 0bbca274a31c2366414d8d3f95 =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     188.79 =C2=B1  0%      +3.6%     195.58 =C2=B1  0%  piglit.time.elaps=
ed_time
>     188.79 =C2=B1  0%      +3.6%     195.58 =C2=B1  0%  piglit.time.elaps=
ed_time.max
>       5.00 =C2=B1  0%     +60.0%       8.00 =C2=B1  0%  piglit.time.perce=
nt_of_cpu_this_job_got
>       7.86 =C2=B1  0%     +83.5%      14.42 =C2=B1  0%  piglit.time.syste=
m_time
>       5.00 =C2=B1  0%     +60.0%       8.00 =C2=B1  0%  time.percent_of_c=
pu_this_job_got
>       7.86 =C2=B1  0%     +83.5%      14.42 =C2=B1  0%  time.system_time
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/group/kconfig/rootfs/tbox_group/testcase:
>   gcc-4.9/igt-036/x86_64-rhel/debian-x86_64-2015-02-07.cgz/lkp-u410/piglit
> =

> commit: =

>   2f791908a70e95768596f5bb9e6de4f441d7bf13
>   0bbca274a31c2366414d8d3f95e03d1c4674d93f
> =

> 2f791908a70e9576 0bbca274a31c2366414d8d3f95 =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     141.15 =C2=B1  0%      +6.9%     150.94 =C2=B1  0%  piglit.time.elaps=
ed_time
>     141.15 =C2=B1  0%      +6.9%     150.94 =C2=B1  0%  piglit.time.elaps=
ed_time.max
>      10.00 =C2=B1  0%     +60.0%      16.00 =C2=B1  0%  piglit.time.perce=
nt_of_cpu_this_job_got
>      10.61 =C2=B1  0%     +88.8%      20.04 =C2=B1  0%  piglit.time.syste=
m_time
>      10.00 =C2=B1  0%     +60.0%      16.00 =C2=B1  0%  time.percent_of_c=
pu_this_job_got
>      10.61 =C2=B1  0%     +88.8%      20.04 =C2=B1  0%  time.system_time
> =

> =

> snb-black: Sandy Bridge
> Memory: 8G
> =

> lkp-u410: Ivy Bridge
> Memory: 4G
> =

> =

> =

>                              piglit.time.system_time
> =

>   21 ++------------------------------------------------------------------=
---+
>   20 O+ O  O  O  O  O  O  O  O  O  O  O  O O  O  O  O  O  O  O  O  O  O  =
   |
>      |                                                                   =
   |
>   19 ++                                                                  =
   |
>   18 ++                                                                  =
   |
>   17 ++                                                                  =
   |
>   16 ++                                                                  =
   |
>      |                                                                   =
   |
>   15 ++                                                                  =
   |
>   14 ++                                                                  =
   |
>   13 ++                                                                  =
   |
>   12 ++                                                                  =
   |
>      |                                                                   =
   |
>   11 *+.*..*..*..*..*..*..*..*..*..*..*..*.*..*..*..*..*..*..*..*..*..*..=
*..*
>   10 ++------------------------------------------------------------------=
---+
> =

> =

>                      piglit.time.percent_of_cpu_this_job_got
> =

>   16 O+-O--O--O--O--O--O--O--O--O--O--O--O-O--O--O--O--O--O--O--O--O--O--=
---+
>      |                                                                   =
   |
>   15 ++                                                                  =
   |
>      |                                                                   =
   |
>      |                                                                   =
   |
>   14 ++                                                                  =
   |
>      |                                                                   =
   |
>   13 ++                                                                  =
   |
>      |                                                                   =
   |
>   12 ++                                                                  =
   |
>      |                                                                   =
   |
>      |                                                                   =
   |
>   11 *+.                  *..         *..           *..                  =
   |
>      |                  ..          ..            ..                     =
   |
>   10 ++-*--*--*--*--*--*-----*--*--*-----*-*--*--*-----*--*--*--*--*--*--=
*--*
> =

> =

>                              piglit.time.elapsed_time
> =

>   152 ++-----------------------------------------------------------------=
---+
>       |  O  O  O  O  O  O O  O  O  O  O  O  O  O  O  O  O  O O  O  O  O  =
   |
>   150 O+                                                                 =
   |
>       |                                                                  =
   |
>       |                                                                  =
   |
>   148 ++                                                                 =
   |
>       |                                                                  =
   |
>   146 ++                                                                 =
   |
>       |                                                                  =
   |
>   144 ++                                                                 =
   |
>       |                                                                  =
   |
>       |                                                                  =
   |
>   142 ++                 .*..                                            =
   |
>       *..     .*..*..*..*    *..*..*..*..     .*..*..*..    .*..*..*..*..=
*..*
>   140 ++-*--*----------------------------*--*-----------*--*-------------=
---+
> =

> =

>                            piglit.time.elapsed_time.max
> =

>   152 ++-----------------------------------------------------------------=
---+
>       |  O  O  O  O  O  O O  O  O  O  O  O  O  O  O  O  O  O O  O  O  O  =
   |
>   150 O+                                                                 =
   |
>       |                                                                  =
   |
>       |                                                                  =
   |
>   148 ++                                                                 =
   |
>       |                                                                  =
   |
>   146 ++                                                                 =
   |
>       |                                                                  =
   |
>   144 ++                                                                 =
   |
>       |                                                                  =
   |
>       |                                                                  =
   |
>   142 ++                 .*..                                            =
   |
>       *..     .*..*..*..*    *..*..*..*..     .*..*..*..    .*..*..*..*..=
*..*
>   140 ++-*--*----------------------------*--*-----------*--*-------------=
---+
> =

> =

>                                 time.system_time
> =

>   21 ++------------------------------------------------------------------=
---+
>   20 O+ O  O  O  O  O  O  O  O  O  O  O  O O  O  O  O  O  O  O  O  O  O  =
   |
>      |                                                                   =
   |
>   19 ++                                                                  =
   |
>   18 ++                                                                  =
   |
>   17 ++                                                                  =
   |
>   16 ++                                                                  =
   |
>      |                                                                   =
   |
>   15 ++                                                                  =
   |
>   14 ++                                                                  =
   |
>   13 ++                                                                  =
   |
>   12 ++                                                                  =
   |
>      |                                                                   =
   |
>   11 *+.*..*..*..*..*..*..*..*..*..*..*..*.*..*..*..*..*..*..*..*..*..*..=
*..*
>   10 ++------------------------------------------------------------------=
---+
> =

> =

>                         time.percent_of_cpu_this_job_got
> =

>   16 O+-O--O--O--O--O--O--O--O--O--O--O--O-O--O--O--O--O--O--O--O--O--O--=
---+
>      |                                                                   =
   |
>   15 ++                                                                  =
   |
>      |                                                                   =
   |
>      |                                                                   =
   |
>   14 ++                                                                  =
   |
>      |                                                                   =
   |
>   13 ++                                                                  =
   |
>      |                                                                   =
   |
>   12 ++                                                                  =
   |
>      |                                                                   =
   |
>      |                                                                   =
   |
>   11 *+.                  *..         *..           *..                  =
   |
>      |                  ..          ..            ..                     =
   |
>   10 ++-*--*--*--*--*--*-----*--*--*-----*-*--*--*-----*--*--*--*--*--*--=
*--*
> =

> =

>  =

> =

>                              piglit.time.system_time
> =

>   15 ++------------------------------------------------------------------=
---+
>      O  O  O  O O  O  O  O  O  O O  O  O  O  O  O O  O  O  O  O  O O  O  =
O  |
>   14 ++                                                                  =
   |
>   13 ++                                                                  =
   |
>      |                                                                   =
   |
>   12 ++                                                                  =
   |
>      |                                                                   =
   |
>   11 ++                                                                  =
   |
>      |                                                                   =
   |
>   10 ++                                                                  =
   |
>    9 ++                                                                  =
   |
>      |                                                                   =
   |
>    8 ++        .*..*..     .*..             .*..*.           .*..*.*..*..=
  .*
>      *..*..*..*       *..*.    *.*..*..*..*.      *..*..*..*.            =
*. |
>    7 ++------------------------------------------------------------------=
---+
> =

> =

>                              piglit.time.elapsed_time
> =

>   450 ++-----------------------------------------------------------------=
---+
>       |                                                                  =
   |
>   400 ++                                     O                           =
   |
>       |                                                                  =
   |
>       |                                                                  =
   |
>   350 ++                                                                 =
   |
>       |                                                                  =
   |
>   300 ++                                                                 =
   |
>       |                                                                  =
   |
>   250 ++                                                                 =
   |
>       |                                                                  =
   |
>       |                                                                  =
   |
>   200 O+.O..O.O..O..O..O..O.O..O..O..O..O.O..*..O..O..O.O..O..O..O..O.O..=
O..*
>       |                                                                  =
   |
>   150 ++-----------------------------------------------------------------=
---+
> =

> =

>                            piglit.time.elapsed_time.max
> =

>   450 ++-----------------------------------------------------------------=
---+
>       |                                                                  =
   |
>   400 ++                                     O                           =
   |
>       |                                                                  =
   |
>       |                                                                  =
   |
>   350 ++                                                                 =
   |
>       |                                                                  =
   |
>   300 ++                                                                 =
   |
>       |                                                                  =
   |
>   250 ++                                                                 =
   |
>       |                                                                  =
   |
>       |                                                                  =
   |
>   200 O+.O..O.O..O..O..O..O.O..O..O..O..O.O..*..O..O..O.O..O..O..O..O.O..=
O..*
>       |                                                                  =
   |
>   150 ++-----------------------------------------------------------------=
---+
> =

> =

>                                 time.system_time
> =

>   15 ++------------------------------------------------------------------=
---+
>      O  O  O  O O  O  O  O  O  O O  O  O  O  O  O O  O  O  O  O  O O  O  =
O  |
>   14 ++                                                                  =
   |
>   13 ++                                                                  =
   |
>      |                                                                   =
   |
>   12 ++                                                                  =
   |
>      |                                                                   =
   |
>   11 ++                                                                  =
   |
>      |                                                                   =
   |
>   10 ++                                                                  =
   |
>    9 ++                                                                  =
   |
>      |                                                                   =
   |
>    8 ++        .*..*..     .*..             .*..*.           .*..*.*..*..=
  .*
>      *..*..*..*       *..*.    *.*..*..*..*.      *..*..*..*.            =
*. |
>    7 ++------------------------------------------------------------------=
---+
> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> Thanks,
> Xiaolong Ye

> ---
> LKP_SERVER: inn
> LKP_CGI_PORT: 80
> LKP_CIFS_PORT: 139
> testcase: piglit
> default-monitors:
>   wait: activate-monitor
>   kmsg: =

>   heartbeat:
>     interval: 10
> default-watchdogs:
>   oom-killer: =

>   watchdog: =

> commit: 0bbca274a31c2366414d8d3f95e03d1c4674d93f
> model: Ivy Bridge
> nr_cpu: 4
> memory: 4G
> nr_hdd_partitions: 0
> hdd_partitions: =

> netconsole_port: 6674
> category: functional
> timeout: 30m
> piglit:
>   group: igt-036
> queue: bisect
> testbox: lkp-u410
> tbox_group: lkp-u410
> kconfig: x86_64-rhel
> enqueue_time: 2016-03-12 08:10:38.141424169 +08:00
> compiler: gcc-4.9
> rootfs: debian-x86_64-2015-02-07.cgz
> id: 7ebc10fb2ac0e90fb2e346efbdcda69faf9f4c18
> user: lkp
> head_commit: 884dcd36fc68f78a12db2ae041eaeadb230b460b
> base_commit: f6cede5b49e822ebc41a099fe41ab4989f64e2cb
> branch: linux-devel/devel-hourly-2016031201
> result_root: "/result/piglit/igt-036/lkp-u410/debian-x86_64-2015-02-07.cg=
z/x86_64-rhel/gcc-4.9/0bbca274a31c2366414d8d3f95e03d1c4674d93f/0"
> job_file: "/lkp/scheduled/lkp-u410/bisect_piglit-igt-036-debian-x86_64-20=
15-02-07.cgz-x86_64-rhel-0bbca274a31c2366414d8d3f95e03d1c4674d93f-20160312-=
31710-1ckf79s-0.yaml"
> max_uptime: 1800
> initrd: "/osimage/debian/debian-x86_64-2015-02-07.cgz"
> bootloader_append:
> - root=3D/dev/ram0
> - user=3Dlkp
> - job=3D/lkp/scheduled/lkp-u410/bisect_piglit-igt-036-debian-x86_64-2015-=
02-07.cgz-x86_64-rhel-0bbca274a31c2366414d8d3f95e03d1c4674d93f-20160312-317=
10-1ckf79s-0.yaml
> - ARCH=3Dx86_64
> - kconfig=3Dx86_64-rhel
> - branch=3Dlinux-devel/devel-hourly-2016031201
> - commit=3D0bbca274a31c2366414d8d3f95e03d1c4674d93f
> - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel/gcc-4.9/0bbca274a31c2366414d8d3f95e=
03d1c4674d93f/vmlinuz-4.5.0-rc7-00002-g0bbca27
> - max_uptime=3D1800
> - RESULT_ROOT=3D/result/piglit/igt-036/lkp-u410/debian-x86_64-2015-02-07.=
cgz/x86_64-rhel/gcc-4.9/0bbca274a31c2366414d8d3f95e03d1c4674d93f/0
> - LKP_SERVER=3Dinn
> - |2-
> =

> =

>   earlyprintk=3DttyS0,115200 systemd.log_level=3Derr
>   debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100
>   panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_=
ramdisk=3D2 prompt_ramdisk=3D0
>   console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal
> =

>   rw
> lkp_initrd: "/lkp/lkp/lkp-x86_64.cgz"
> modules_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/0bbca274a31c2366414d8d3f9=
5e03d1c4674d93f/modules.cgz"
> bm_initrd: "/osimage/deps/debian-x86_64-2015-02-07.cgz/lkp.cgz,/osimage/d=
eps/debian-x86_64-2015-02-07.cgz/run-ipconfig.cgz,/osimage/deps/debian-x86_=
64-2015-02-07.cgz/piglit.cgz,/lkp/benchmarks/piglit.cgz"
> linux_headers_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/0bbca274a31c2366414=
d8d3f95e03d1c4674d93f/linux-headers.cgz"
> repeat_to: 2
> kernel: "/pkg/linux/x86_64-rhel/gcc-4.9/0bbca274a31c2366414d8d3f95e03d1c4=
674d93f/vmlinuz-4.5.0-rc7-00002-g0bbca27"
> dequeue_time: 2016-03-12 08:14:04.556438362 +08:00
> job_state: finished
> loadavg: 0.81 0.38 0.15 1/116 693
> start_time: '1457741713'
> end_time: '1457741864'
> version: "/lkp/lkp/.src-20160311-183612"

> 2016-03-12 08:15:13 piglit run igt -t igt/kms_cursor_crc/cursor-64-slidin=
g /tmp/lkp/piglit-results
> 2016-03-12 08:17:43 piglit summary console /tmp/lkp/piglit-results/result=
s.json


-- =

Ville Syrj=C3=A4l=C3=A4
Intel OTC

--===============6216185578532605808==--

