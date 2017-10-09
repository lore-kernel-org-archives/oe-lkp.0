Content-Type: multipart/mixed; boundary="===============0449936928689818030=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Mon, 09 Oct 2017 20:55:04 +0800
Message-ID: <20171009125504.gpb3z4xtsstq756k@wfg-t540p.sh.intel.com>
In-Reply-To: <20171009122113.nj2tn22mt2oxptvr@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0449936928689818030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2017 at 08:21:13PM +0800, Fengguang Wu wrote:
>On Mon, Oct 09, 2017 at 12:50:55PM +0200, Peter Zijlstra wrote:
>>> Fengguang, if you're still listening, could you please rerun the tests
>>> on top of ce07a9415f26, with the attached patches also applied?
>>
>>Ping!? it would be very good to get feedback on this asap.
>
>Sorry for the delay!
>
>>> From e7840ad76515f0b5061fcdd098b57b7c01b61482 Mon Sep 17 00:00:00 2001
>>> Message-Id: <e7840ad76515f0b5061fcdd098b57b7c01b61482.1507215196.git.jp=
oimboe@redhat.com>
>>> From: Josh Poimboeuf <jpoimboe@redhat.com>
>>> Date: Thu, 5 Oct 2017 09:43:59 -0500
>>> Subject: [PATCH 1/2] unwinder fixes
>>>
>>> ---
>>>  arch/x86/kernel/unwind_frame.c | 33 ++++++++++++++++++++++++++++++---
>
>I just test 316 boots and see 7 WARNINGs:
>
>[  404.948035] WARNING: kernel stack frame pointer at c6ea3ecd in init:212=
 has bad value   (null)
>[  298.118383] WARNING: kernel stack frame pointer at cde07dad in init:1 h=
as bad value bc000000
>[  112.848677] WARNING: kernel stack frame pointer at cde07dbd in swapper/=
0:1 has bad value c2000000
>[  127.942417] WARNING: kernel stack frame pointer at cf95de71 in rb_produ=
cer:50 has bad value 03cf95de
>[    4.736938] WARNING: kernel stack frame pointer at bf643d59 in kworker/=
0:1:15 has bad value b5000000
>[  308.260066] WARNING: kernel stack frame pointer at bde07da5 in udevd:15=
5 has bad value b5bfa17b
>
>[  277.473596] WARNING: CPU: 0 PID: 520 at kernel/locking/lockdep.c:3841 c=
heck_flags+0x119/0x1b0

It's easier to reproduce the warning when applying the patches onto v4.14-r=
c3.
Out of 60 boots there are 33 warnings:

wfg(a)inn /pkg/linux/i386-randconfig-i0-201739/gcc-4.8/955f0ec8f62949acd4ac=
f546c0647b1ecf94177a% grep -h WARNING dmesg-* | sort -k10
[  118.200019] WARNING: kernel stack frame pointer at be3d3cf1 in 01-cpu-ho=
tplug:12673 has bad value b9000002
[   82.170015] WARNING: kernel stack frame pointer at be3b9cbd in 01-cpu-ho=
tplug:3060 has bad value b4000002
[   14.180024] WARNING: kernel stack frame pointer at bf681e49 in kworker/0=
:1:15 has bad value 02c09ba5
[    5.090018] WARNING: kernel stack frame pointer at bf681e2d in kworker/0=
:1:15 has bad value b6000002
[   13.130018] WARNING: kernel stack frame pointer at bf681e2d in kworker/0=
:1:15 has bad value b7000002
[    8.980018] WARNING: kernel stack frame pointer at bf681e2d in kworker/0=
:1:15 has bad value b7000002
[    8.200024] WARNING: kernel stack frame pointer at bf681e2d in kworker/0=
:1:15 has bad value ba000002
[   18.450017] WARNING: kernel stack frame pointer at bc681e2d in kworker/0=
:1:15 has bad value bc000002
[   69.260017] WARNING: kernel stack frame pointer at bdf75c19 in procd:560=
 has bad value b4000062
[   57.520019] WARNING: kernel stack frame pointer at bb01bee5 in rb_produc=
er:42 has bad value   (null)
[    8.990015] WARNING: kernel stack frame pointer at bdebde1d in rhashtabl=
e_thra:111 has bad value b9000002
[   17.460024] WARNING: kernel stack frame pointer at bdebbe1d in rhashtabl=
e_thra:111 has bad value ba000002
[    9.520011] WARNING: kernel stack frame pointer at bdeb7e89 in rhashtabl=
e_thra:113 has bad value b7c0aca7
[   10.270015] WARNING: kernel stack frame pointer at bdec5e1d in rhashtabl=
e_thra:113 has bad value b9000002
[    5.230009] WARNING: kernel stack frame pointer at bded1e6d in rhashtabl=
e_thra:116 has bad value b6000002
[    9.510016] WARNING: kernel stack frame pointer at bb2d3e1d in rhashtabl=
e_thra:117 has bad value bc000002
[    5.110018] WARNING: kernel stack frame pointer at bded7e1d in rhashtabl=
e_thra:119 has bad value b4000002
[   17.250023] WARNING: kernel stack frame pointer at baed7ebd in rhashtabl=
e_thra:119 has bad value bb000002
[   87.380014] WARNING: kernel stack frame pointer at be2bbe6d in seq:2906 =
has bad value 01000000
[   34.460022] WARNING: kernel stack frame pointer at bf60fca1 in swapper/0=
:1 has bad value 00001225
[   21.350222] WARNING: kernel stack frame pointer at bf60fc19 in swapper/0=
:1 has bad value 00bf60fd
[   22.020027] WARNING: kernel stack frame pointer at bf60fc19 in swapper/0=
:1 has bad value 00bf60fd
[   21.950020] WARNING: kernel stack frame pointer at bca0fe81 in swapper/0=
:1 has bad value 01000000
[   16.530022] WARNING: kernel stack frame pointer at bf60fe59 in swapper/0=
:1 has bad value 040e703b
[   15.490015] WARNING: kernel stack frame pointer at bf60fe59 in swapper/0=
:1 has bad value 085ecca1
[   26.350019] WARNING: kernel stack frame pointer at bf60fcbd in swapper/0=
:1 has bad value 35c11e37
[   22.980019] WARNING: kernel stack frame pointer at bc60fe59 in swapper/0=
:1 has bad value 863d8471
[   25.850018] WARNING: kernel stack frame pointer at bf60fcc9 in swapper/0=
:1 has bad value 9300aa2a
[   51.810025] WARNING: kernel stack frame pointer at bf60fca1 in swapper/0=
:1 has bad value a17ffffe
[   17.400081] WARNING: kernel stack frame pointer at bf60fcfd in swapper/0=
:1 has bad value b4000000
[    0.880020] WARNING: kernel stack frame pointer at bf60fddd in swapper/0=
:1 has bad value bb000002
[   12.640008] WARNING: kernel stack frame pointer at bf60fe69 in swapper/0=
:1 has bad value bdbb4dd0
[    0.920032] WARNING: kernel stack frame pointer at bf76fe61 in torture_s=
tutter:37 has bad value b5000000

Thanks,
Fengguang

--===============0449936928689818030==--

