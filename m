Content-Type: multipart/mixed; boundary="===============4778051197204561451=="
MIME-Version: 1.0
From: Peer, Ilan <ilan.peer@intel.com>
To: lkp@lists.01.org
Subject: Re: [cfg80211] eeca9fce1d7: BUG: kernel boot oversize
Date: Tue, 24 Mar 2015 08:34:51 +0000
Message-ID: <CB3B3D4774441E42AA3EA0E1BA8230A04D07972A@HASMSX106.ger.corp.intel.com>
In-Reply-To: <1427182312.17170.29.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4778051197204561451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

This mean u probably do not have crda installed, or it is not properly conf=
igured. These are debug prints so the simplest would be to disable CONFIG_C=
FG80211_REG_DEBUG .. unless you are debugging wireless regulatory flows.

Regardless, I'll try to come up with a better solution to handle such cases.

Thanks,

Ilan.

> -----Original Message-----
> From: Huang, Ying
> Sent: Tuesday, March 24, 2015 09:32
> To: Peer, Ilan
> Cc: Berg, Johannes; LKML; lkp(a)01.org
> Subject: [LKP] [cfg80211] eeca9fce1d7: BUG: kernel boot oversize
> =

> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git mas=
ter
> commit eeca9fce1d71a4955855ceb0c3b13c1eb9db27c1 ("cfg80211:
> Schedule timeout for all CRDA calls")
> =

> =

> +-------------------------+------------+------------+
> |                         | 0505075360 | eeca9fce1d |
> +-------------------------+------------+------------+
> | boot_successes          | 9          | 9          |
> | boot_failures           | 0          | 1          |
> | BUG:kernel_boot_crashed | 0          | 1          |
> +-------------------------+------------+------------+
> =

> It appears too many like like below in dmesg after applying the patch in a
> virtual machine.
> =

> [11223.232543] cfg80211: Kicking the queue [11223.233674] cfg80211:
> Calling CRDA to update world regulatory domain
> =

> BUG: kernel boot oversize
> Elapsed time: 11150
> qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap -kernel
> /kernel/x86_64-randconfig-n0-
> 03210642/ca2fd9633ed4fe8a5ad56efb2fcef061a19f2e90/vmlinuz-4.0.0-rc4-
> wl-ath-03682-gca2fd963 -append 'user=3Dlkp job=3D/lkp/scheduled/vm-kbuild-
> 1G-10/rand_boot-1-x86_64-randconfig-n0-03210642-
> ca2fd9633ed4fe8a5ad56efb2fcef061a19f2e90-0.yaml ARCH=3Dx86_64
> BOOT_IMAGE=3D/kernel/x86_64-randconfig-n0-
> 03210642/ca2fd9633ed4fe8a5ad56efb2fcef061a19f2e90/vmlinuz-4.0.0-rc4-
> wl-ath-03682-gca2fd963 kconfig=3Dx86_64-randconfig-n0-03210642
> commit=3Dca2fd9633ed4fe8a5ad56efb2fcef061a19f2e90 branch=3Dlinux-
> devel/devel-hourly-2015032023 root=3D/dev/ram0 max_uptime=3D3600
> RESULT_ROOT=3D/result/vm-kbuild-1G/boot/1/debian-x86_64-2015-02-
> 07.cgz/x86_64-randconfig-n0-
> 03210642/ca2fd9633ed4fe8a5ad56efb2fcef061a19f2e90/0 ip=3D::::vm-
> kbuild-1G-10::dhcp earlyprintk=3DttyS0,115200 rd.udev.log-priority=3Derr
> systemd.log_target=3Djournal systemd.log_level=3Dwarning debug apic=3Ddeb=
ug
> sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 panic=3D-1
> softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdisk=3D2
> prompt_ramdisk=3D0 console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal rw'=
  -
> initrd /fs/sdd1/initrd-vm-kbuild-1G-10 -m 1024 -smp 2 -net
> nic,vlan=3D1,model=3De1000 -net user,vlan=3D1 -boot order=3Dnc -no-reboot=
 -
> watchdog i6300esb -rtc base=3Dlocaltime -device virtio-scsi-pci,id=3Dscsi=
0 -drive
> file=3D/fs/sdd1/disk0-vm-kbuild-1G-
> 10,if=3Dnone,id=3Dhd0,media=3Ddisk,aio=3Dnative,cache=3Dnone -device scsi-
> hd,bus=3Dscsi0.0,drive=3Dhd0,scsi-id=3D1,lun=3D0 -drive file=3D/fs/sdd1/d=
isk1-vm-
> kbuild-1G-10,if=3Dnone,id=3Dhd1,media=3Ddisk,aio=3Dnative,cache=3Dnone -d=
evice scsi-
> hd,bus=3Dscsi0.0,drive=3Dhd1,scsi-id=3D1,lun=3D1 -drive file=3D/fs/sdd1/d=
isk2-vm-
> kbuild-1G-10,if=3Dnone,id=3Dhd2,media=3Ddisk,aio=3Dnative,cache=3Dnone -d=
evice scsi-
> hd,bus=3Dscsi0.0,drive=3Dhd2,scsi-id=3D1,lun=3D2 -drive file=3D/fs/sdd1/d=
isk3-vm-
> kbuild-1G-10,if=3Dnone,id=3Dhd3,media=3Ddisk,aio=3Dnative,cache=3Dnone -d=
evice scsi-
> hd,bus=3Dscsi0.0,drive=3Dhd3,scsi-id=3D1,lun=3D3 -drive file=3D/fs/sdd1/d=
isk4-vm-
> kbuild-1G-10,if=3Dnone,id=3Dhd4,media=3Ddisk,aio=3Dnative,cache=3Dnone -d=
evice scsi-
> hd,bus=3Dscsi0.0,drive=3Dhd4,scsi-id=3D1,lun=3D4 -pidfile /dev/shm/kboot/=
pid-vm-
> kbuild-1G-10 -serial file:/dev/shm/kboot/serial-vm-kbuild-1G-10 -daemoniz=
e -
> display none -monitor null
> =

> =

> =

> Thanks,
> Ying Huang


--===============4778051197204561451==--

