Content-Type: multipart/mixed; boundary="===============1469365256800783492=="
MIME-Version: 1.0
From: kernel test robot <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: cbb02697f8 [ 64.240371] BUG: Bad rss-counter state mm: (ptrval) idx:1 val:1
Date: Thu, 11 Oct 2018 20:28:01 +0800
Message-ID: <20181011122801.GJ13396@shao2-debian>
In-Reply-To: <20181011095924.jobk7asdykdzung6@master>
List-Id: <oe-lkp.lists.linux.dev>

--===============1469365256800783492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 11, 2018 at 09:59:24AM +0000, richard.weiyang(a)gmail.com wrote:
> Oops,
> =

> Thanks for testing.
> =

> On Thu, Oct 11, 2018 at 04:33:28PM +0800, kernel test robot wrote:
> >Greetings,
> >
> >0day kernel testing robot got the below dmesg and the first bad commit is
> >
> >https://github.com/0day-ci/linux/commits/owner-linux-mm-kvack-org/mm-rem=
ove-a-redundant-check-in-do_munmap/20181011-061535
> >
> >commit cbb02697f838cc10002c3ac09f0468791d8bf328
> >Author:     owner-linux-mm(a)kvack.org <owner-linux-mm@kvack.org>
> >AuthorDate: Wed Oct 10 20:53:27 2018 +0800
> >Commit:     0day robot <lkp@intel.com>
> >CommitDate: Thu Oct 11 06:15:36 2018 +0800
> >
> >    mm: remove a redundant check in do_munmap()
> >    =

> >    A non-NULL vma returned from find_vma() implies:
> >    =

> >       vma->vm_start <=3D start
> >    =

> >    Since len !=3D 0, the following condition always hods:
> >    =

> >       vma->vm_start < start + len =3D end
> >    =

> >    This means the if check would never be true.
> >    =

> >    This patch removes this redundant check and fix two typo in comment.
> >    =

> >    Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> >
> >dd52cb8790  Merge tag 'platform-drivers-x86-v4.17-4' of git://git.infrad=
ead.org/linux-platform-drivers-x86
> >cbb02697f8  mm: remove a redundant check in do_munmap()
> >+------------------------------------------------+------------+---------=
---+
> >|                                                | dd52cb8790 | cbb02697=
f8 |
> >+------------------------------------------------+------------+---------=
---+
> >| boot_successes                                 | 52         | 7       =
   |
> >| boot_failures                                  | 0          | 22      =
   |
> >| IP-Config:Auto-configuration_of_network_failed | 0          | 2       =
   |
> >| BUG:Bad_rss-counter_state_mm:(ptrval)idx:#val  | 0          | 13      =
   |
> >| BUG:Bad_rss-counter_state_mm:#idx:#val         | 0          | 5       =
   |
> >| kernel_BUG_at_mm/filemap.c                     | 0          | 5       =
   |
> >| invalid_opcode:#[##]                           | 0          | 5       =
   |
> >| RIP:unaccount_page_cache_page                  | 0          | 5       =
   |
> >| Kernel_panic-not_syncing:Fatal_exception       | 0          | 5       =
   |
> >+------------------------------------------------+------------+---------=
---+
> >
> >[child2:625] ppoll (271) returned ENOSYS, marking as inactive.
> >[child2:625] pkey_mprotect (329) returned ENOSYS, marking as inactive.
> >[child2:625] swapon (167) returned ENOSYS, marking as inactive.
> >[child2:625] splice (275) returned ENOSYS, marking as inactive.
> >[child3:637] readlinkat (267) returned ENOSYS, marking as inactive.
> >[   64.240371] BUG: Bad rss-counter state mm:        (ptrval) idx:1 val:1
> >[child2:652] faccessat (269) returned ENOSYS, marking as inactive.
> >[child2:652] clock_adjtime (305) returned ENOSYS, marking as inactive.
> >[child0:615] accept (43) returned ENOSYS, marking as inactive.
> >[child0:615] io_submit (209) returned ENOSYS, marking as inactive.
> >[child0:615] pwritev2 (328) returned ENOSYS, marking as inactive.
> >
> >                                                          # HH:MM RESULT=
 GOOD BAD GOOD_BUT_DIRTY DIRTY_NOT_BAD
> >git bisect start b3b6bb615d30ce1a710a3c3c415567af214cb34a 0238df646e6224=
016a45505d2c111a24669ebe21 --
> >git bisect  bad 92cca9f16f670b4d5e78fa5fe118be92d2e2209b  # 11:16  B    =
  0    13   30   2  Merge 'tty/tty-next' into devel-spot-201810110745
> >git bisect  bad c84cb0975077ea9b3b32190c55a8779241581209  # 11:16  B    =
  0    11   29   3  Merge 'linux-review/Juergen-Gross/xen-drop-writing-erro=
r-messages-to-xenstore/20181011-032312' into devel-spot-201810110745
> >git bisect  bad 1658f3952513eff47b1c63a76c74d974d1b9455a  # 11:16  B    =
  0    13   31   3  Merge 'radeon-alex/drm-next-4.20' into devel-spot-20181=
0110745
> >git bisect  bad b76535f30171e534a0dc48864c14c5fe6b726546  # 11:16  B    =
  0    34   52   3  Merge 'userns/new-mount-api-testing' into devel-spot-20=
1810110745
> >git bisect good 8a2c32fd1e09b34d6cf01ff8323c469e346b4dee  # 11:16  G    =
 11     0    0   6  Merge 'linux-review/Carl-Huang/ath10k-allocate-small-si=
ze-dma-memory-in-ath10k_pci_diag_write_mem/20181011-065025' into devel-spot=
-201810110745
> >git bisect good 4bb0052f3fa5f10e6820b48749d5b66200a806ac  # 11:16  G    =
 11     0    0   1  Merge 'ceph-client/testing' into devel-spot-201810110745
> >git bisect  bad 54602f4b420feb7650f1589fa589bc5aeab49fed  # 14:00  B    =
  0     4   18   0  Merge 'linux-review/owner-linux-mm-kvack-org/mm-remove-=
a-redundant-check-in-do_munmap/20181011-061535' into devel-spot-201810110745
> >git bisect  bad cbb02697f838cc10002c3ac09f0468791d8bf328  # 14:45  B    =
  0     1    1   1  mm: remove a redundant check in do_munmap()
> ># first bad commit: [cbb02697f838cc10002c3ac09f0468791d8bf328] mm: remov=
e a redundant check in do_munmap()
> >git bisect good dd52cb879063ca5470d5a093c32180ba74fa528e  # 15:29  G    =
 52     0    0   0  Merge tag 'platform-drivers-x86-v4.17-4' of git://git.i=
nfradead.org/linux-platform-drivers-x86
> ># extra tests with debug options
> >git bisect  bad cbb02697f838cc10002c3ac09f0468791d8bf328  # 15:48  B    =
  0     3   17   0  mm: remove a redundant check in do_munmap()
> ># extra tests on HEAD of linux-devel/devel-spot-201810110745
> >git bisect  bad b3b6bb615d30ce1a710a3c3c415567af214cb34a  # 15:48  B    =
  0    24   44   2  0day head guard for 'devel-spot-201810110745'
> ># extra tests on tree/branch linux-review/owner-linux-mm-kvack-org/mm-re=
move-a-redundant-check-in-do_munmap/20181011-061535
> >git bisect  bad cbb02697f838cc10002c3ac09f0468791d8bf328  # 15:50  B    =
  4     7    0   5  mm: remove a redundant check in do_munmap()
> ># extra tests with first bad commit reverted
> >git bisect good 217501d4a8346ca87cd5482bf151b5dc46944ab1  # 16:17  G    =
 16     0    0   0  Revert "mm: remove a redundant check in do_munmap()"
> >
> >---
> >0-DAY kernel test infrastructure                Open Source Technology C=
enter
> >https://lists.01.org/pipermail/lkp                          Intel Corpor=
ation
> =

> Below is the testing script, right?
> =

yes, please have a try.

Best Regards,
Rong Chen

> >#!/bin/bash
> >
> >kernel=3D$1
> >initrd=3Dyocto-trinity-x86_64.cgz
> >
> >wget --no-clobber https://github.com/fengguang/reproduce-kernel-bug/raw/=
master/yocto/$initrd
> >
> >kvm=3D(
> >	qemu-system-x86_64
> >	-enable-kvm
> >	-cpu Haswell,+smep,+smap
> >	-kernel $kernel
> >	-initrd $initrd
> >	-m 512
> >	-smp 1
> >	-device e1000,netdev=3Dnet0
> >	-netdev user,id=3Dnet0
> >	-boot order=3Dnc
> >	-no-reboot
> >	-watchdog i6300esb
> >	-watchdog-action debug
> >	-rtc base=3Dlocaltime
> >	-serial stdio
> >	-display none
> >	-monitor null
> >)
> >
> >append=3D(
> >	root=3D/dev/ram0
> >	hung_task_panic=3D1
> >	debug
> >	apic=3Ddebug
> >	sysrq_always_enabled
> >	rcupdate.rcu_cpu_stall_timeout=3D100
> >	net.ifnames=3D0
> >	printk.devkmsg=3Don
> >	panic=3D-1
> >	softlockup_panic=3D1
> >	nmi_watchdog=3Dpanic
> >	oops=3Dpanic
> >	load_ramdisk=3D2
> >	prompt_ramdisk=3D0
> >	drbd.minor_count=3D8
> >	systemd.log_level=3Derr
> >	ignore_loglevel
> >	console=3Dtty0
> >	earlyprintk=3DttyS0,115200
> >	console=3DttyS0,115200
> >	vga=3Dnormal
> >	rw
> >	drbd.minor_count=3D8
> >	rcuperf.shutdown=3D0
> >)
> >
> >"${kvm[@]}" -append "${append[*]}"
>=20

--===============1469365256800783492==--

