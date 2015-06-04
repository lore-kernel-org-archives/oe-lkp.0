Content-Type: multipart/mixed; boundary="===============2160071205851194027=="
MIME-Version: 1.0
From: Ming Lin <mlin@kernel.org>
To: lkp@lists.01.org
Subject: Re: [block] fbccf1df065: +276.3% boot-meminfo.KernelStack
Date: Wed, 03 Jun 2015 23:56:32 -0700
Message-ID: <1433400992.10431.3.camel@hasee>
In-Reply-To: <CAC=cRTNMnyFJN=M7nyR65fwR8qFYYak_oJacoA_wpt7Lozdthw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2160071205851194027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2015-06-04 at 08:49 +0800, huang ying wrote:
> Hi, Ming,
> =

> Here it is.
> =

> qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap
> -kernel /pkg/linux/x86_64-lkp/gcc-4.9/fbccf1df06574add60bdb71103cc1662e47=
7f02d/vmlinuz-4.1.0-rc4-00001-gfbccf1d -append 'root=3D/dev/ram0 user=3Dlkp=
 job=3D/lkp/scheduled/vm-kbuild-1G-15/bisect_boot-1-debian-x86_64-2015-02-0=
7.cgz-x86_64-lkp-fbccf1df06574add60bdb71103cc1662e477f02d-1-20150529-44276-=
1cpbx2s.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-lkp branch=3Dlinux-devel/devel-=
hourly-2015052515 commit=3Dfbccf1df06574add60bdb71103cc1662e477f02d BOOT_IM=
AGE=3D/pkg/linux/x86_64-lkp/gcc-4.9/fbccf1df06574add60bdb71103cc1662e477f02=
d/vmlinuz-4.1.0-rc4-00001-gfbccf1d max_uptime=3D600 RESULT_ROOT=3D/result/b=
oot/1/vm-kbuild-1G/debian-x86_64-2015-02-07.cgz/x86_64-lkp/gcc-4.9/fbccf1df=
06574add60bdb71103cc1662e477f02d/0 LKP_SERVER=3Dinn earlyprintk=3DttyS0,115=
200 systemd.log_level=3Derr debug apic=3Ddebug sysrq_always_enabled rcupdat=
e.rcu_cpu_stall_timeout=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=
=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 console=3DttyS0,1=
15200 console=3Dtty0 vga=3Dnormal rw ip=3D::::vm-kbuild-1G-15::dhcp'  -init=
rd /fs/sda1/initrd-vm-kbuild-1G-15 -m 1024 -smp 2 -device e1000,netdev=3Dne=
t0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot -watchdog i6300esb -r=
tc base=3Dlocaltime -device virtio-scsi-pci,id=3Dscsi0 -drive file=3D/fs/sd=
a1/disk0-vm-kbuild-1G-15,if=3Dnone,id=3Dhd0,media=3Ddisk,aio=3Dnative,cache=
=3Dnone -device scsi-hd,bus=3Dscsi0.0,drive=3Dhd0,scsi-id=3D1,lun=3D0 -driv=
e file=3D/fs/sda1/disk1-vm-kbuild-1G-15,if=3Dnone,id=3Dhd1,media=3Ddisk,aio=
=3Dnative,cache=3Dnone -device scsi-hd,bus=3Dscsi0.0,drive=3Dhd1,scsi-id=3D=
1,lun=3D1 -drive file=3D/fs/sda1/disk2-vm-kbuild-1G-15,if=3Dnone,id=3Dhd2,m=
edia=3Ddisk,aio=3Dnative,cache=3Dnone -device scsi-hd,bus=3Dscsi0.0,drive=
=3Dhd2,scsi-id=3D1,lun=3D2 -drive file=3D/fs/sda1/disk3-vm-kbuild-1G-15,if=
=3Dnone,id=3Dhd3,media=3Ddisk,aio=3Dnative,cache=3Dnone -device scsi-hd,bus=
=3Dscsi0.0,drive=3Dhd3,scsi-id=3D1,lun=3D3 -drive file=3D/fs/sda1/disk4-vm-=
kbuild-1G-15,if=3Dnone,id=3Dhd4,media=3Ddisk,aio=3Dnative,cache=3Dnone -dev=
ice scsi-hd,bus=3Dscsi0.0,drive=3Dhd4,scsi-id=3D1,lun=3D4 -pidfile /dev/shm=
/kboot/pid-vm-kbuild-1G-15 -serial file:/dev/shm/kboot/serial-vm-kbuild-1G-=
15 -daemonize -display none -monitor null

Here is the fix.
I'll merge it to patch "block: make generic_make_request handle
arbitrarily sized bios".

Thanks Ying.
> =

diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
index 2b8fd30..feaeb12 100644
--- a/block/blk-sysfs.c
+++ b/block/blk-sysfs.c
@@ -522,6 +522,8 @@ static void blk_release_queue(struct kobject *kobj)
 =

 	blk_trace_shutdown(q);
 =

+	bioset_free(q->bio_split);
+
 	ida_simple_remove(&blk_queue_ida, q->id);
 	call_rcu(&q->rcu_head, blk_free_queue_rcu);
 }



--===============2160071205851194027==--

