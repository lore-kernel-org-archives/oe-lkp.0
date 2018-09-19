Content-Type: multipart/mixed; boundary="===============3528944548238030572=="
MIME-Version: 1.0
From: Li Zhijian <zhijianx.li@intel.com>
To: lkp@lists.01.org
Subject: Re: [ipc] 61224adcd2: general_protection_fault:#[##]
Date: Wed, 19 Sep 2018 10:06:10 +0800
Message-ID: <0bebe825-7f1a-47c1-9e8b-52d47d6a1722@intel.com>
In-Reply-To: <22268.1537284200@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============3528944548238030572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/18/2018 11:23 PM, David Howells wrote:
>> 1. please type following command to verify the lkp-src
>> $ gzip -dc/home/dhowells/.lkp/cache/lkp-x86_64-ad88cb1a437a_.cgz | cpio =
-t
>>
>> it should have something like
>> lizhijian(a)ivb44:~$ gzip -dc .lkp/cache/lkp-x86_64-ebf5822e1818_.cgz | =
cpio -t | head
> It has a lot more than the listed files, but it does have all the ones you
> listed.  Note that my cpio -t sorts things in a different order to yours
>
>> 2. remove this file and try again with following changes
> The cgz file listed in (1)?

Yes


>
> I turned on "set -x".  I presumed you wanted the output sending to you.
>
> Anyway, note that it seems I need to do mkdir ~/.lkp/cache before running=
 the
> qemu command,

LKP tools would help to create this directory, and your host already had th=
is according to the listed file you post previously

> final_initrd  initrd-concatenated  lkp/  lkp-x86_64-ad88cb1a437a_.cgz  os=
image/
>
> Note that ~/.lkp is a symlink to somewhere that I don't mind clobbering.
>


not clear why you cannot create cpio under ~/.lkp/cache dir


> + local tmp_src=3D/tmp/lkp_initrd-root/lkp/lkp/src
> + local archive=3D/home/dhowells/.lkp/cache/lkp-x86_64
> + local 'cpio_cmd=3Dcpio --quiet -o --owner root:lkp -H newc -F/home/dhow=
ells/.lkp/cache/lkp-x86_64.cpio'
> + rm -f/home/dhowells/.lkp/cache/lkp-x86_64.cpio
> + cd /tmp/lkp_initrd-root/rootfs
> + find lkp
> + cpio --quiet -o --owner root:lkp -H newc -F/home/dhowells/.lkp/cache/lk=
p-x86_64.cpio
> cpio: Cannot open/home/dhowells/.lkp/cache/lkp-x86_64.cpio: No such file =
or directory


> otherwise cpio commands fail.  With that, trinity appears to be
> running.

According=C2=A0 to the log you attached, trinity didn't run due to the lkp-=
src.cgz(lkp-x86_64-ad88cb1a437a_xxx.cgz) haven't be merged into the runtime=
 rootfs.


below is the full log on my env
---
lizhijian(a)haswell-OptiPlex-9020:~/lkp/lkp-qemu$ pwd
/home/lizhijian/lkp/lkp-qemu
lizhijian(a)haswell-OptiPlex-9020:~/lkp/lkp-qemu$ ls
job.sh  vmlinuz-4.19.0-rc2-00211-g61224ad
lizhijian(a)haswell-OptiPlex-9020:~/lkp/lkp-qemu$ ls ~/.lkp -ld
ls: cannot access '/home/lizhijian/.lkp': No such file or directory
lizhijian(a)haswell-OptiPlex-9020:~/lkp/lkp-qemu$ sudo ~/lkp-tests/bin/lkp =
qemu -k vmlinuz-4.19.0-rc2-00211-g61224ad job.sh
The approx. disk space requirements are

10M             simple boot test in rootfs openwrt
50M		simple boot test in rootfs debian
1G              plan to run a number of different tests
100G or more    IO tests

Please enter a dir with enough disk space, or simply press Enter to accept =
the default.
You may still symlink /home/lizhijian/.lkp to a more suitable place in futu=
re.
/home/lizhijian/.lkp =3D>
cpio: File lkp/jobs/scheduled/vm-lkp-hsw01-yocto-x86_64-43/trinity-300s-yoc=
to-minimal-x86_64-2016-04-22.cgz-61224adcd25b0abd01f02459e82b30735161e723-2=
0180913-83000-1fq8z3y-0-df108.cpio grew, 512 new bytes not copied
12 blocks
result_root: /home/lizhijian/.lkp//result/trinity/300s/vm-lkp-hsw01-yocto-x=
86_64/yocto-minimal-x86_64-2016-04-22.cgz/x86_64-randconfig-ne0-09121830/gc=
c-6/61224adcd25b0abd01f02459e82b30735161e723/0
downloading initrds ...
/usr/bin/wget -q --local-encoding=3DUTF-8 --retry-connrefused --waitretry 1=
000 --tries 1000 http://bee.sh.intel.com:80/~lkp/osimage/yocto/yocto-minima=
l-x86_64-2016-04-22.cgz -N -P /home/lizhijian/.lkp/cache/osimage/yocto
13925 blocks
/usr/bin/wget -q --local-encoding=3DUTF-8 --retry-connrefused --waitretry 1=
000 --tries 1000 http://bee.sh.intel.com:80/~lkp/osimage/pkg/debian-x86_64-=
2016-08-31.cgz/trinity-static-x86_64-x86_64-6ddabfd2_2017-11-10.cgz -N -P /=
home/lizhijian/.lkp/cache/osimage/pkg/debian-x86_64-2016-08-31.cgz
26031 blocks
Formatting '/tmp/vdisk-root/disk-vm-lkp-hsw01-yocto-x86_64-43-0', fmt=3Dqco=
w2 size=3D274877906944 encryption=3Doff cluster_size=3D65536 lazy_refcounts=
=3Doff refcount_bits=3D16
Formatting '/tmp/vdisk-root/disk-vm-lkp-hsw01-yocto-x86_64-43-1', fmt=3Dqco=
w2 size=3D274877906944 encryption=3Doff cluster_size=3D65536 lazy_refcounts=
=3Doff refcount_bits=3D16
exec command: qemu-system-x86_64 -enable-kvm -fsdev local,id=3Dtest_dev,pat=
h=3D/home/lizhijian/.lkp//result/trinity/300s/vm-lkp-hsw01-yocto-x86_64/yoc=
to-minimal-x86_64-2016-04-22.cgz/x86_64-randconfig-ne0-09121830/gcc-6/61224=
adcd25b0abd01f02459e82b30735161e723/0,security_model=3Dnone -device virtio-=
9p-pci,fsdev=3Dtest_dev,mount_tag=3D9p/virtfs_mount -kernel vmlinuz-4.19.0-=
rc2-00211-g61224ad -append root=3D/dev/ram0 user=3Dlkp job=3D/lkp/jobs/sche=
duled/vm-lkp-hsw01-yocto-x86_64-43/trinity-300s-yocto-minimal-x86_64-2016-0=
4-22.cgz-61224adcd25b0abd01f02459e82b30735161e723-20180913-83000-1fq8z3y-0.=
yaml ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-ne0-09121830 branch=3Dlinux-=
next/master commit=3D61224adcd25b0abd01f02459e82b30735161e723 BOOT_IMAGE=3D=
/pkg/linux/x86_64-randconfig-ne0-09121830/gcc-6/61224adcd25b0abd01f02459e82=
b30735161e723/vmlinuz-4.19.0-rc2-00211-g61224ad max_uptime=3D1500 RESULT_RO=
OT=3D/result/trinity/300s/vm-lkp-hsw01-yocto-x86_64/yocto-minimal-x86_64-20=
16-04-22.cgz/x86_64-randconfig-ne0-09121830/gcc-6/61224adcd25b0abd01f02459e=
82b30735161e723/0 LKP_LOCAL_RUN=3D1 debug apic=3Ddebug sysrq_always_enabled=
 rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Don p=
anic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ramdi=
sk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr igno=
re_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200 console=3DttyS0,11520=
0 vga=3Dnormal rw  ip=3Ddhcp result_service=3D9p/virtfs_mount -initrd /home=
/lizhijian/.lkp/cache/final_initrd -smp 1 -m 256M -no-reboot -watchdog i630=
0esb -rtc base=3Dlocaltime -device e1000,netdev=3Dnet0 -netdev user,id=3Dne=
t0 -display none -monitor null -serial stdio -drive file=3D/tmp/vdisk-root/=
disk-vm-lkp-hsw01-yocto-x86_64-43-0,media=3Ddisk,if=3Dvirtio -drive file=3D=
/tmp/vdisk-root/disk-vm-lkp-hsw01-yocto-x86_64-43-1,media=3Ddisk,if=3Dvirtio
early console in setup code
early console in extract_kernel
input_data: 0x000000000379f2e9
input_len: 0x0000000000bfaac9
output: 0x0000000001000000
output_len: 0x0000000002c30258
kernel_total_size: 0x00000000033bd000
trampoline_32bit: 0x000000000009d000

Decompressing Linux... Parsing ELF... done.
Booting the kernel.
[    0.000000] Linux version 4.19.0-rc2-00211-g61224ad (kbuild(a)sof-kbuild=
01) (gcc version 6.4.0 20171026 (Debian 6.4.0-9)) #1 Thu Sep 13 00:56:50 CS=
T 2018
[    0.000000] Command line: root=3D/dev/ram0 user=3Dlkp job=3D/lkp/jobs/sc=
heduled/vm-lkp-hsw01-yocto-x86_64-43/trinity-300s-yocto-minimal-x86_64-2016=
-04-22.cgz-61224adcd25b0abd01f02459e82b30735161e723-20180913-83000-1fq8z3y-=
0.yaml ARCH=3Dx86_64 kconfig=3Dx86_64-randconfig-ne0-09121830 branch=3Dlinu=
x-next/master commit=3D61224adcd25b0abd01f02459e82b30735161e723 BOOT_IMAGE=
=3D/pkg/linux/x86_64-randconfig-ne0-09121830/gcc-6/61224adcd25b0abd01f02459=
e82b30735161e723/vmlinuz-4.19.0-rc2-00211-g61224ad max_uptime=3D1500 RESULT=
_ROOT=3D/result/trinity/300s/vm-lkp-hsw01-yocto-x86_64/yocto-minimal-x86_64=
-2016-04-22.cgz/x86_64-randconfig-ne0-09121830/gcc-6/61224adcd25b0abd01f024=
59e82b30735161e723/0 LKP_LOCAL_RUN=3D1 debug apic=3Ddebug sysrq_always_enab=
led rcupdate.rcu_cpu_stall_timeout=3D100 net.ifnames=3D0 printk.devkmsg=3Do=
n panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_ra=
mdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8 systemd.log_level=3Derr i=
gnore_loglevel console=3Dtty0 earlyprintk=3DttyS0,115200 console=3DttyS0,11=
5200 vg
[    0.000000] x86/fpu: x87 FPU will use FXSAVE
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[...snip...]
[    4.165953] random: get_random_bytes called from addrconf_dad_kick+0x92/=
0x110 with crng_init=3D0
[    4.184619] Sending DHCP requests .
[    4.184629] random: get_random_bytes called from ic_dynamic+0x296/0xfd0 =
with crng_init=3D0
[    4.186656] , OK
[    4.187101] IP-Config: Got DHCP answer from 10.0.2.2, my address is 10.0=
.2.15
[    4.188162] IP-Config: Complete:
[    4.188726]      device=3Deth0, hwaddr=3D52:54:00:12:34:56, ipaddr=3D10.=
0.2.15, mask=3D255.255.255.0, gw=3D10.0.2.2
[    4.190163]      host=3D10.0.2.15, domain=3D, nis-domain=3D(none)
[    4.191103]      bootserver=3D10.0.2.2, rootserver=3D10.0.2.2, rootpath=
=3D
[    4.191106]      nameserver0=3D10.0.2.3
[    4.197574] Freeing unused kernel image memory: 1684K
[    4.198259] Write protecting the kernel read-only data: 28672k
[    4.199968] Freeing unused kernel image memory: 2004K
[    4.200944] Freeing unused kernel image memory: 1440K
[    4.218255] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    4.219068] rodata_test: all tests were successful
[    4.219655] x86/mm: Checking user space page tables
[    4.236740] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    4.237504] Run /init as init process
[    4.238113] random: get_random_u64 called from arch_rnd+0x43/0x70 with c=
rng_init=3D0
INIT: version 2.88 booting
/etc/rcS.d/S00fbsetup: line 3: /sbin/modprobe: not found
Starting udev
[    4.283879] udevd[135]: starting version 3.1.5
[    4.284888] random: udevd: uninitialized urandom read (16 bytes read)
[    4.285729] random: udevd: uninitialized urandom read (16 bytes read)
[    4.286518] random: udevd: uninitialized urandom read (16 bytes read)
bootlogd: cannot allocate pseudo tty: No such file or directory
Populating dev cache
hwclock: can't open '/dev/misc/rtc': No such file or directory
INIT: Entering runlevel: 5
Configuring network interfaces... done.
hwclock: can't open '/dev/misc/rtc': No such file or directory
Starting syslogd/klogd: done
PATH=3D/sbin:/usr/sbin:/bin:/usr/bin:/lkp/lkp/src/bin
LKP: HOSTNAME vm-lkp-hsw01-yocto-x86_64-43, MAC 52:54:00:12:34:56, kernel 4=
.19.0-rc2-00211-g61224ad 1, serial console /dev/ttyS0

Poky (Yocto Project Reference Distro) 2.1 vm-lkp-hsw01-yocto-x86_64-43 /dev=
/ttyS0

vm-lkp-hsw01-yocto-x86_64-43 login: [    5.809653] mount: mounting 9p/virtf=
s_mount on //result/trinity/300s/vm-lkp-hsw01-yocto-x86_64/yocto-minimal-x8=
6_64-2016-04-22.cgz/x86_64-randconfig-ne0-09121830/gcc-6/61224adcd25b0abd01=
f02459e82b30735161e723/0 failed: No such device
[    5.809653] /lkp/lkp/src/monitors/heartbeat: line 9: vmstat: not found
[    5.809653] /lkp/lkp/src/monitors/heartbeat: exec: line 23: vmstat: not =
found
[    5.813778] Kernel tests: Boot OK!
[    5.813778] /lkp/lkp/src/bin/run-lkp
[    5.813778] RESULT_ROOT=3D/result/trinity/300s/vm-lkp-hsw01-yocto-x86_64=
/yocto-minimal-x86_64-2016-04-22.cgz/x86_64-randconfig-ne0-09121830/gcc-6/6=
1224adcd25b0abd01f02459e82b30735161e723/0
[    5.813778] job=3D/lkp/jobs/scheduled/vm-lkp-hsw01-yocto-x86_64-43/trini=
ty-300s-yocto-minimal-x86_64-2016-04-22.cgz-61224adcd25b0abd01f02459e82b307=
35161e723-20180913-83000-1fq8z3y-0.yaml
[    5.813778] run-job /lkp/jobs/scheduled/vm-lkp-hsw01-yocto-x86_64-43/tri=
nity-300s-yocto-minimal-x86_64-2016-04-22.cgz-61224adcd25b0abd01f02459e82b3=
0735161e723-20180913-83000-1fq8z3y-0.yaml
[    5.813778] skip http request: cgi-bin/lkp-jobfile-append-var?job_file=
=3D/lkp/jobs/scheduled/vm-lkp-hsw01-yocto-x86_64-43/trinity-300s-yocto-mini=
mal-x86_64-2016-04-22.cgz-61224adcd25b0abd01f02459e82b30735161e723-20180913=
-83000-1fq8z3y-0.yaml&job_state=3Drunning -O /dev/null
[    5.813778] target ucode:
[    5.925243] _warn_unseeded_randomness: 1521 callbacks suppressed
[    5.925255] random: get_random_u64 called from arch_rnd+0x43/0x70 with c=
rng_init=3D0
[    5.929774] random: get_random_u64 called from load_elf_binary+0x5c1/0x1=
d80 with crng_init=3D0
[    5.933200] random: get_random_u32 called from map_vdso_randomized+0x9f/=
0xd0 with crng_init=3D0
[    6.823397] BusyBox v1.24.1 (2016-04-15 14:06:13 GMT) multi-call binary.
[    6.823397]
[    6.823397] Usage: time [-v] PROG ARGS
[    7.515148] _warn_unseeded_randomness: 76 callbacks suppressed
[    7.515157] random: get_random_u32 called from bucket_table_alloc+0x104/=
0x2f0 with crng_init=3D0
[    7.896417] random: get_random_u64 called from arch_rnd+0x43/0x70 with c=
rng_init=3D0
[    7.897153] random: get_random_u64 called from load_elf_binary+0x5c1/0x1=
d80 with crng_init=3D0
[    8.825245] cat: write error: Invalid argument
[   14.808842] _warn_unseeded_randomness: 3 callbacks suppressed
[   14.808853] random: get_random_u64 called from arch_rnd+0x43/0x70 with c=
rng_init=3D0
[   14.811599] random: get_random_u64 called from load_elf_binary+0x5c1/0x1=
d80 with crng_init=3D0
[   14.813791] random: get_random_u32 called from map_vdso_randomized+0x9f/=
0xd0 with crng_init=3D0
[   15.954725] _warn_unseeded_randomness: 5 callbacks suppressed
[   15.954741] random: get_random_u64 called from arch_rnd+0x43/0x70 with c=
rng_init=3D0
[   15.959934] random: get_random_u64 called from load_elf_binary+0x5c1/0x1=
d80 with crng_init=3D0
[   15.962280] random: get_random_u64 called from arch_rnd+0x43/0x70 with c=
rng_init=3D0
[   16.551517] trinity-main uses obsolete (PF_INET,SOCK_PACKET)
[   16.580197] general protection fault: 0000 [#1] PTI
[   16.580695] CPU: 0 PID: 662 Comm: trinity-c2 Tainted: G                T=
 4.19.0-rc2-00211-g61224ad #1
[   16.581517] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
Ubuntu-1.8.2-1ubuntu1 04/01/2014
[   16.582373] RIP: 0010:mqueue_get_tree+0x41/0x110
[   16.582846] Code: 29 4d 63 01 48 8b 45 00 4c 8b 20 31 c0 4d 85 e4 0f 95 =
c0 48 83 c0 02 48 83 04 c5 e8 af 02 83 01 4d 85 e4 74 50 e8 ef 13 be ff <49=
> 8b 04 24 4c 8b a0 40 04 00 00 31 c0 4d 85 e4 0f 95 c0 48 83 c0
[   16.584573] RSP: 0018:ffffc90000a57d90 EFLAGS: 00010293
[   16.585065] RAX: 0000000000000000 RBX: ffff88000b9f7228 RCX: 00000000000=
00000
[   16.585637] RDX: ffff8800099c4840 RSI: ffffffff81606341 RDI: ffff88000b9=
f7228
[   16.586261] RBP: ffff88000a630ac8 R08: ffffffff82f1dee0 R09: ffff88000a6=
30ac8
[   16.586946] R10: ffffc90000a57d00 R11: ffff88000a630410 R12: 6b6b6b6b6b6=
b6b6b
[   16.587624] R13: ffff88000a4f7a78 R14: 0000000000000000 R15: ffffffff82c=
1c540
[   16.588319] FS:  000000000104a880(0000) GS:ffffffff82c3c000(0000) knlGS:=
0000000000000000
[   16.589139] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   16.589616] CR2: 00000000011ef7e8 CR3: 000000000a4f2000 CR4: 00000000000=
006b0
[   16.590323] Call Trace:
[   16.590600]  vfs_get_tree+0xe6/0x320
[   16.590973]  mq_init_ns+0xef/0x220
[   16.591310]  copy_ipcs+0x19c/0x250
[   16.592215]  create_new_namespaces+0x18b/0x4f0
[   16.592631]  unshare_nsproxy_namespaces+0xaa/0x140
[   16.593116]  ksys_unshare+0x3e3/0x6a0
[   16.593509]  __x64_sys_unshare+0x17/0x20
[   16.593918]  do_syscall_64+0xbc/0xa10
[   16.594308]  ? trace_hardirqs_off_thunk+0x1a/0x2b
[   16.594792]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[   16.595305] RIP: 0033:0x458527
[   16.595639] Code: 00 00 00 b8 63 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 =
ad 72 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 b8 10 01 00 00 0f 05 <48=
> 3d 01 f0 ff ff 0f 83 8d 72 00 00 c3 66 2e 0f 1f 84 00 00 00 00
[   16.597125] RSP: 002b:00007ffc5559d628 EFLAGS: 00000217 ORIG_RAX: 000000=
0000000110
[   16.597881] RAX: ffffffffffffffda RBX: 00000000011f2e60 RCX: 00000000004=
58527
[   16.598554] RDX: 0000000001045510 RSI: 00007ffc5559d60c RDI: 00000000080=
00000
[   16.599178] RBP: 0000000000000296 R08: 00000000010454e4 R09: 00000000010=
45560
[   16.599759] R10: 0000000000456697 R11: 0000000000000217 R12: 00000000004=
b7820
[   16.600380] R13: 0000000000000002 R14: 0000000000000000 R15: 00000000000=
00000
[   16.601061] Modules linked in:
[   16.601412] ---[ end trace 9c0f5694bf6c3b03 ]---
[   16.601879] RIP: 0010:mqueue_get_tree+0x41/0x110
[   16.602307] Code: 29 4d 63 01 48 8b 45 00 4c 8b 20 31 c0 4d 85 e4 0f 95 =
c0 48 83 c0 02 48 83 04 c5 e8 af 02 83 01 4d 85 e4 74 50 e8 ef 13 be ff <49=
> 8b 04 24 4c 8b a0 40 04 00 00 31 c0 4d 85 e4 0f 95 c0 48 83 c0
[   16.603736] RSP: 0018:ffffc90000a57d90 EFLAGS: 00010293
[   16.604193] RAX: 0000000000000000 RBX: ffff88000b9f7228 RCX: 00000000000=
00000
[   16.604856] RDX: ffff8800099c4840 RSI: ffffffff81606341 RDI: ffff88000b9=
f7228
[   16.605492] RBP: ffff88000a630ac8 R08: ffffffff82f1dee0 R09: ffff88000a6=
30ac8
[   16.606202] R10: ffffc90000a57d00 R11: ffff88000a630410 R12: 6b6b6b6b6b6=
b6b6b
[   16.606894] R13: ffff88000a4f7a78 R14: 0000000000000000 R15: ffffffff82c=
1c540
[   16.607597] FS:  000000000104a880(0000) GS:ffffffff82c3c000(0000) knlGS:=
0000000000000000
[   16.608413] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   16.609017] CR2: 00000000011ef7e8 CR3: 000000000a4f2000 CR4: 00000000000=
006b0
[   16.609710] Kernel panic - not syncing: Fatal exception
[   16.610226] Kernel Offset: disabled


lizhijian(a)haswell-OptiPlex-9020:~/lkp/lkp-qemu$ ls -ld ~/.lkp/
drwxr-xr-x 5 root root 4096 9=E6=9C=88  19 10:12 /home/lizhijian/.lkp/
lizhijian(a)haswell-OptiPlex-9020:~/lkp/lkp-qemu$ ls -l ~/.lkp/cache/
total 12800
-rw-r--r-- 1 root root 6548980 9=E6=9C=88  19 10:14 final_initrd
-rw-r--r-- 1 root root 4583149 9=E6=9C=88  19 10:14 initrd-concatenated
drwxr-xr-x 3 root root    4096 9=E6=9C=88  19 10:12 lkp
-rw-rw-r-- 1 root root 1964312 9=E6=9C=88  19 10:12 lkp-x86_64-ad88cb1a437a=
_.cgz
drwxr-xr-x 4 root root    4096 9=E6=9C=88  19 10:14 osimage


Thanks


>
> David


--===============3528944548238030572==--

