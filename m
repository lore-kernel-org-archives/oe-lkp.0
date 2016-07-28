Content-Type: multipart/mixed; boundary="===============4169786013020133583=="
MIME-Version: 1.0
From: Alexander Potapenko <glider@google.com>
To: lkp@lists.01.org
Subject: Re: [mm, kasan] a6efa0b2aa: Undefined behaviour in mm/kasan/quarantine.c:102:13
Date: Thu, 28 Jul 2016 19:49:38 +0200
Message-ID: <CAG_fn=UXRkaEBV-b5CY3zktAAksAHs6b1e8QC3waLN1FLPUSKg@mail.gmail.com>
In-Reply-To: <CAG_fn=X8VPbXpNBOt5W7FG2QbziAjE682bfcLfRXP27AAo2hXA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4169786013020133583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Sent patchset v8 to fix this problem.

On Wed, Jul 27, 2016 at 3:30 PM, Alexander Potapenko <glider@google.com> =
wrote:
> I couldn't reproduce the problem locally. But most likely this happens
> because kasan_create_cache() sometimes sets
> cache->kasan_info.free_meta_offset to a multiple of 4.
> We need to force the 8-byte alignment of the offset.
>
> On Tue, Jul 26, 2016 at 4:15 AM, kernel test robot
> <xiaolong.ye@intel.com> wrote:
>>
>> FYI, we noticed the following commit:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mast=
er
>> commit a6efa0b2aa5568872abff95bfa7d8a4dba00f86f ("mm, kasan: switch SLUB=
 to stackdepot, enable memory quarantine for SLUB")
>>
>> in testcase: boot
>>
>> on test machine: 1 threads qemu-system-x86_64 -enable-kvm -cpu SandyBrid=
ge with 320M memory
>>
>> caused below changes:
>>
>>
>>  7809 [   18.666107] UBSAN: Undefined behaviour in mm/kasan/quarantine.c=
:102:13
>>  7810 [   18.668198] member access within misaligned address ffff88000d1=
efebc for type 'struct qlist_node'
>>  7811 [   18.670368] which requires 8 byte alignment
>>  7812 [   18.671494] CPU: 0 PID: 1 Comm: swapper Not tainted 4.7.0-rc7-0=
0368-ga6efa0b #1
>>  7813 [   18.673400] Hardware name: QEMU Standard PC (i440FX + PIIX, 199=
6), BIOS Debian-1.8.2-1 04/01/2014
>>  7814 [   18.675812]  0000000000000000 ffff88000d4af918 ffffffff81ac3c82=
 ffff88000d4af938
>>  7815 [   18.678219]  ffffffff81b60046 000000000000001f ffffffff8370a6c0=
 ffff88000d4af9d8
>>  7816 [   18.680606]  ffffffff81b60a2f ffffffff8370b44c 0000000041b58ab3=
 ffffffff82b6a7c6
>>  7817 [   18.683014] Call Trace:
>>  7818 [   18.683822]  [<ffffffff81ac3c82>] dump_stack+0x19/0x1b
>>  7819 [   18.685112]  [<ffffffff81b60046>] ubsan_epilogue+0xe/0x84
>>  7820 [   18.687650]  [<ffffffff81b60a2f>] __ubsan_handle_type_mismatch+=
0x1e2/0x20a
>>  7821 [   18.689369]  [<ffffffff81b6084d>] ? __ubsan_handle_divrem_overf=
low+0x16c/0x16c
>>  7822 [   18.691296]  [<ffffffff81339dd2>] ? ___slab_alloc+0x710/0x93e
>>  7823 [   18.692941]  [<ffffffff81ac781f>] ? idr_get_empty_slot+0xddf/0x=
ddf
>>  7824 [   18.698603]  [<ffffffff81343846>] quarantine_reduce+0x1d3/0x23f
>>  7825 [   18.700062]  [<ffffffff81341ef4>] kasan_kmalloc+0x28/0x91
>>  7826 [   18.701428]  [<ffffffff81341f6f>] kasan_slab_alloc+0x12/0x14
>>  7827 [   18.702846]  [<ffffffff8133a3c4>] kmem_cache_alloc+0x334/0x451
>>  7828 [   18.704305]  [<ffffffff81478c73>] ? __kernfs_new_node+0xa9/0x1ff
>>  7829 [   18.705794]  [<ffffffff81478c73>] __kernfs_new_node+0xa9/0x1ff
>>  7830 [   18.707243]  [<ffffffff81478bca>] ? kernfs_dop_revalidate+0x2c9=
/0x2c9
>>  7831 [   18.721888]  [<ffffffff81ad541c>] ? rb_first+0x35/0x8c
>>  7832 [   18.723213]  [<ffffffff81478843>] ? kernfs_leftmost_descendant+=
0x48/0x5b
>>  7833 [   18.724800]  [<ffffffff8147c0a7>] kernfs_new_node+0xa0/0xe2
>>  7834 [   18.726201]  [<ffffffff81480506>] __kernfs_create_file+0x33/0x1=
9f
>>  7835 [   18.727704]  [<ffffffff81482179>] sysfs_add_file_mode_ns+0x26c/=
0x3cd
>>  7836 [   18.729371]  [<ffffffff81482505>] sysfs_add_file+0x50/0x57
>>  7837 [   18.730834]  [<ffffffff81483ff0>] sysfs_merge_group+0x109/0x1d4
>>  7838 [   18.748017]  [<ffffffff81dd60bc>] dpm_sysfs_add+0x9e/0x13e
>>  7839 [   18.749196]  [<ffffffff81dbb549>] device_add+0xa66/0x1034
>>  7840 [   18.750342]  [<ffffffff81dbaae3>] ? device_private_init+0x1e9/0=
x1e9
>>  7841 [   18.751629]  [<ffffffff81db7eac>] ? device_create_file+0x155/0x=
155
>>  7842 [   18.752898]  [<ffffffff8133a926>] ? kmem_cache_alloc_trace+0x44=
5/0x457
>>  7843 [   18.754233]  [<ffffffff81dc09d3>] ? subsys_register+0x3d/0x168
>>  7844 [   18.755544]  [<ffffffff81dbbb31>] device_register+0x1a/0x1d
>>  7845 [   18.756717]  [<ffffffff81dc0a97>] subsys_register+0x101/0x168
>>  7846 [   18.758022]  [<ffffffff81dc3561>] subsys_system_register+0x34/0=
x3a
>>  7847 [   18.759308]  [<ffffffff86c85359>] ? edac_mc_sysfs_init+0xcf/0xcf
>>  7848 [   18.769681]  [<ffffffff86c85378>] edac_init+0x1f/0x70
>>  7849 [   18.779343]  [<ffffffff81000597>] do_one_initcall+0x14e/0x200
>>  7850 [   18.780772]  [<ffffffff81000449>] ? initcall_blacklisted+0x146/=
0x146
>>  7851 [   18.790449]  [<ffffffff8114c800>] ? remove_wait_queue+0x154/0x1=
ca
>>  7852 [   18.791916]  [<ffffffff8112f59a>] ? preempt_count_sub+0x18/0xd9
>>  7853 [   18.793370]  [<ffffffff86c01a28>] kernel_init_freeable+0x2b8/0x=
34c
>>  7854 [   18.794868]  [<ffffffff82580aba>] kernel_init+0x11/0x11b
>>  7855 [   18.796185]  [<ffffffff8258becf>] ret_from_fork+0x1f/0x40
>>  7856 [   18.797540]  [<ffffffff82580aa9>] ? rest_init+0x90/0x90
>>  7857 [   18.807610] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>
>>
>>
>> FYI, raw QEMU command line is:
>>
>>         qemu-system-x86_64 -enable-kvm -cpu SandyBridge -kernel /pkg/lin=
ux/x86_64-randconfig-s4-07242348/gcc-6/a6efa0b2aa5568872abff95bfa7d8a4dba00=
f86f/vmlinuz-4.7.0-rc7-00368-ga6efa0b -append 'root=3D/dev/ram0 user=3Dlkp =
job=3D/lkp/scheduled/vm-kbuild-yocto-x86_64-59/boot-1-yocto-minimal-x86_64.=
cgz-a6efa0b2aa5568872abff95bfa7d8a4dba00f86f-20160725-6441-1w86cht-0.yaml A=
RCH=3Dx86_64 kconfig=3Dx86_64-randconfig-s4-07242348 branch=3Dlinux-next/ma=
ster commit=3Da6efa0b2aa5568872abff95bfa7d8a4dba00f86f BOOT_IMAGE=3D/pkg/li=
nux/x86_64-randconfig-s4-07242348/gcc-6/a6efa0b2aa5568872abff95bfa7d8a4dba0=
0f86f/vmlinuz-4.7.0-rc7-00368-ga6efa0b max_uptime=3D600 RESULT_ROOT=3D/resu=
lt/boot/1/vm-kbuild-yocto-x86_64/yocto-minimal-x86_64.cgz/x86_64-randconfig=
-s4-07242348/gcc-6/a6efa0b2aa5568872abff95bfa7d8a4dba00f86f/0 LKP_SERVER=3D=
inn debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100 panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic lo=
ad_ramdisk=3D2 prompt_ramdisk=3D0 systemd.log_level=3Derr ignore_loglevel e=
arlyprintk=3DttyS0,115200 console=3DttyS0,115200 console=3Dtty0 vga=3Dnorma=
l rw ip=3D::::vm-kbuild-yocto-x86_64-59::dhcp drbd.minor_count=3D8'  -initr=
d /fs/sdg1/initrd-vm-kbuild-yocto-x86_64-59 -m 320 -smp 1 -device e1000,net=
dev=3Dnet0 -netdev user,id=3Dnet0 -boot order=3Dnc -no-reboot -watchdog i63=
00esb -rtc base=3Dlocaltime -drive file=3D/fs/sdg1/disk0-vm-kbuild-yocto-x8=
6_64-59,media=3Ddisk,if=3Dvirtio -pidfile /dev/shm/kboot/pid-vm-kbuild-yoct=
o-x86_64-59 -serial file:/dev/shm/kboot/serial-vm-kbuild-yocto-x86_64-59 -d=
aemonize -display none -monitor null
>>
>>
>>
>>
>>
>> Thanks,
>> Xiaolong
>
>
>
> --
> Alexander Potapenko
> Software Engineer
>
> Google Germany GmbH
> Erika-Mann-Stra=C3=9Fe, 33
> 80636 M=C3=BCnchen
>
> Gesch=C3=A4ftsf=C3=BChrer: Matthew Scott Sucherman, Paul Terence Manicle
> Registergericht und -nummer: Hamburg, HRB 86891
> Sitz der Gesellschaft: Hamburg



-- =

Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Matthew Scott Sucherman, Paul Terence Manicle
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg

--===============4169786013020133583==--

