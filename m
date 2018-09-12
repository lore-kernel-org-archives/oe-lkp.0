Content-Type: multipart/mixed; boundary="===============2388239796436076433=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [vfs] fd0002870b: BUG:KASAN:null-ptr-deref_in_n
Date: Wed, 12 Sep 2018 08:34:52 +0800
Message-ID: <0bac086d-13a5-7275-fd08-7e9bfc58f562@intel.com>
In-Reply-To: <10338.1536697773@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============2388239796436076433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/12/2018 04:29 AM, David Howells wrote:
> kernel test robot <rong.a.chen@intel.com> wrote:
>
>> [   18.568403]  nfs_fs_mount+0x901/0x1220
> I don't suppose you can tell me what file and line number this correspond=
s to?
$ faddr2line vmlinux nfs_fs_mount+0x901
nfs_fs_mount+0x901/0x1218:
nfs_parse_devname at fs/nfs/super.c:1911
 =C2=A0(inlined by) nfs_validate_text_mount_data at fs/nfs/super.c:2187
 =C2=A0(inlined by) nfs_fs_mount at fs/nfs/super.c:2684

>
> Also, can you tell me what the mount parameters were?  I'm not sure how to
> extract them from the information provided.
qemu command (you could get from 'bin/lkp qemu -k <bzImage> job-script'):

qemu-system-x86_64 -enable-kvm -fsdev =

local,id=3Dtest_dev,path=3D/home/nfs/.lkp//result/boot/1/vm-kbuild-1G/debia=
n-x86_64-2018-04-03.cgz/x86_64-randconfig-r0-09070102/gcc-6/fd0002870b453c5=
8d0d8c195954f5049bc6675fb/0,security_model=3Dnone =

-device virtio-9p-pci,fsdev=3Dtest_dev,mount_tag=3D9p/virtfs_mount -kernel =

vmlinuz-4.19.0-rc1-00104-gfd00028 -append root=3D/dev/ram0 user=3Dlkp =

job=3D/lkp/jobs/scheduled/vm-kbuild-1G-11/boot-1-debian-x86_64-2018-04-03.c=
gz-fd0002870b453c58d0d8c195954f5049bc6675fb-20180910-6016-1hqt4et-1.yaml =

ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-r0-09070102 =

branch=3Dlinux-devel/devel-hourly-2018090623 =

commit=3Dfd0002870b453c58d0d8c195954f5049bc6675fb =

BOOT_IMAGE=3D/pkg/linux/x86_64-randconfig-r0-09070102/gcc-6/fd0002870b453c5=
8d0d8c195954f5049bc6675fb/vmlinuz-4.19.0-rc1-00104-gfd00028 =

max_uptime=3D600 =

RESULT_ROOT=3D/result/boot/1/vm-kbuild-1G/debian-x86_64-2018-04-03.cgz/x86_=
64-randconfig-r0-09070102/gcc-6/fd0002870b453c58d0d8c195954f5049bc6675fb/3 =

LKP_LOCAL_RUN=3D1 debug apic=3Ddebug sysrq_always_enabled =

rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don =

panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramd=
isk=3D2 =

prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr =

ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200 =

console=3DttyS0,115200 vga=3Dnormal rw=C2=A0 ip=3Ddhcp =

result_service=3D9p/virtfs_mount -initrd /home/nfs/.lkp/cache/final_initrd =

-smp 2 -m 1024M -no-reboot -watchdog i6300esb -rtc base=3Dlocaltime =

-device e1000,netdev=3Dnet0 -netdev user,id=3Dnet0 -display none -monitor =

null -serial stdio -device virtio-scsi-pci,id=3Dscsi0 -drive =

file=3D/tmp/vdisk-nfs/disk-vm-kbuild-1G-11-0,if=3Dnone,id=3Dhd0,media=3Ddis=
k,aio=3Dnative,cache=3Dnone =

-device scsi-hd,bus=3Dscsi0.0,drive=3Dhd0,scsi-id=3D1,lun=3D0 -drive =

file=3D/tmp/vdisk-nfs/disk-vm-kbuild-1G-11-1,if=3Dnone,id=3Dhd1,media=3Ddis=
k,aio=3Dnative,cache=3Dnone =

-device scsi-hd,bus=3Dscsi0.0,drive=3Dhd1,scsi-id=3D1,lun=3D1 -drive =

file=3D/tmp/vdisk-nfs/disk-vm-kbuild-1G-11-2,if=3Dnone,id=3Dhd2,media=3Ddis=
k,aio=3Dnative,cache=3Dnone =

-device scsi-hd,bus=3Dscsi0.0,drive=3Dhd2,scsi-id=3D1,lun=3D2 -drive =

file=3D/tmp/vdisk-nfs/disk-vm-kbuild-1G-11-3,if=3Dnone,id=3Dhd3,media=3Ddis=
k,aio=3Dnative,cache=3Dnone =

-device scsi-hd,bus=3Dscsi0.0,drive=3Dhd3,scsi-id=3D1,lun=3D3 -drive =

file=3D/tmp/vdisk-nfs/disk-vm-kbuild-1G-11-4,if=3Dnone,id=3Dhd4,media=3Ddis=
k,aio=3Dnative,cache=3Dnone =

-device scsi-hd,bus=3Dscsi0.0,drive=3Dhd4,scsi-id=3D1,lun=3D4

Best Regards,
Rong Chen

>
> Thanks,
> David
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp


--===============2388239796436076433==--

