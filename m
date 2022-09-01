Content-Type: multipart/mixed; boundary="===============7316867668988783718=="
MIME-Version: 1.0
From: Russ Weight <russell.h.weight@intel.com>
To: lkp@lists.01.org
Subject: Re: [selftests] a37ddddd86: BUG:KASAN:use-after-free_in_firmware_upload_unregister
Date: Thu, 01 Sep 2022 09:20:03 -0700
Message-ID: <be12970a-4288-d093-adf2-f2cf14be1a17@intel.com>
In-Reply-To: <95b1f303-421c-420a-0d34-6f00ffaae723@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7316867668988783718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thanks for the reply. I was able to reproduce it a couple of weeks ago and
I have already submitted a fix.

- Russ

On 8/31/22 22:43, Yujie Liu wrote:
> Hi Russ,
>
> On 8/2/2022 04:42, Russ Weight wrote:
>> Oliver,
>>
>> On 7/29/22 00:08, kernel test robot wrote:
>>>
>>> Greeting,
>>>
>>> FYI, we noticed the following commit (built with gcc-11):
>>>
>>> commit: a37ddddd86037c896c702b4df416bc4e51b2a5a0 ("selftests: firmware:=
 Add firmware upload selftests")
>>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>>
>>> in testcase: kernel-selftests
>>> version: kernel-selftests-x86_64-4cb0bec3-1_20220724
>>> with following parameters:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0group: firmware
>>> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0xec
>>>
>>> test-description: The kernel contains a set of "self tests" under the t=
ools/testing/selftests/ directory. These are intended to be small unit test=
s to exercise individual code paths in the kernel.
>>> test-url: https://www.kernel.org/doc/Documentation/kselftest.txt
>>>
>>>
>>> on test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz with=
 28G memory
>>>
>>> caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
>>>
>>>
>>>
>>> If you fix the issue, kindly add following tag
>>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>>
>>>
>>> [ 103.520572][ T2443] BUG: KASAN: use-after-free in firmware_upload_unr=
egister (drivers/base/firmware_loader/sysfs_upload.c:395)
>>> [=C2=A0 103.520579][ T2443] Read of size 8 at addr ffff8881e186c808 by =
task fw_upload.sh/2443
>>> [=C2=A0 103.528481][=C2=A0 T395]
>>> [=C2=A0 103.534696][ T2443]
>>> [=C2=A0 103.534698][ T2443] CPU: 7 PID: 2443 Comm: fw_upload.sh Not tai=
nted 5.18.0-rc2-00036-ga37ddddd8603 #1
>>> [=C2=A0 103.534701][ T2443] Hardware name: Dell Inc. OptiPlex 7040/0Y7W=
YT, BIOS 1.2.8 01/26/2016
>>> [=C2=A0 103.534703][ T2443] Call Trace:
>>> [=C2=A0 103.534705][ T2443]=C2=A0 <TASK>
>>> [ 103.534707][ T2443] ? firmware_upload_unregister (drivers/base/firmwa=
re_loader/sysfs_upload.c:395)
>> I believe I understand the problem, but I have been unable to reproduce =
the error to verify the fix:
>>
>> 394=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device_unregister(&f=
w_sysfs->dev);
>> 395=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 module_put(fw_upload=
_priv->module);
>>
>> The device_unregister() call could result in the dev_release
>> function freeing the fw_upload_priv structure before it is
>> dereferenced on line 395. Copying fw_upload_priv->module to a
>> local variable for use when calling device_unregister()
>> should fix the problem.
>>
>>> [ 103.534713][ T2443] dump_stack_lvl (lib/dump_stack.c:107 (discriminat=
or 4))
>>> [ 103.588011][ T2443] print_address_description+0x1f/0x200
>>> [ 103.594406][ T2443] ? firmware_upload_unregister (drivers/base/firmwa=
re_loader/sysfs_upload.c:395)
>>> [ 103.600112][ T2443] print_report.cold (mm/kasan/report.c:430)
>>> [ 103.604782][ T2443] ? do_raw_spin_lock (arch/x86/include/asm/atomic.h=
:202 include/linux/atomic/atomic-instrumented.h:543 include/asm-generic/qsp=
inlock.h:82 kernel/locking/spinlock_debug.c:115)
>>> [ 103.609624][ T2443] kasan_report (mm/kasan/report.c:162 mm/kasan/repo=
rt.c:493)
>>> [ 103.613861][ T2443] ? firmware_upload_unregister (drivers/base/firmwa=
re_loader/sysfs_upload.c:395)
>>> [ 103.619561][ T2443] firmware_upload_unregister (drivers/base/firmware=
_loader/sysfs_upload.c:395)
>>> [ 103.625091][ T2443] upload_unregister_store (lib/test_firmware.c:1060=
 lib/test_firmware.c:1321)
>>> [ 103.630377][ T2443] ? sysfs_file_ops (fs/sysfs/file.c:129)
>>> [ 103.635046][ T2443] kernfs_fop_write_iter (fs/kernfs/file.c:294)
>>> [ 103.640145][ T2443] new_sync_write (fs/read_write.c:505 (discriminato=
r 1))
>>> [ 103.644642][ T2443] ? new_sync_read (fs/read_write.c:494)
>>> [ 103.649225][ T2443] ? ksys_write (fs/read_write.c:644)
>>> [ 103.653463][ T2443] ? rcu_read_unlock (include/linux/rcupdate.h:723 (=
discriminator 5))
>>> [ 103.658057][ T2443] ? lock_is_held_type (kernel/locking/lockdep.c:538=
2 kernel/locking/lockdep.c:5684)
>>> [ 103.662909][ T2443] vfs_write (fs/read_write.c:591)
>>> [ 103.666984][ T2443] ksys_write (fs/read_write.c:644)
>>> [ 103.671057][ T2443] ? __ia32_sys_read (fs/read_write.c:634)
>>> [ 103.675645][ T2443] ? lockdep_hardirqs_on_prepare (kernel/locking/loc=
kdep.c:4501)
>>> [ 103.682051][ T2443] ? syscall_enter_from_user_mode (arch/x86/include/=
asm/irqflags.h:45 arch/x86/include/asm/irqflags.h:80 kernel/entry/common.c:=
109)
>>> [ 103.687756][ T2443] do_syscall_64 (arch/x86/entry/common.c:50 arch/x8=
6/entry/common.c:80)
>>> [ 103.692010][ T2443] ? pick_file (fs/file.c:660)
>>> [ 103.696165][ T2443] ? do_raw_spin_unlock (arch/x86/include/asm/atomic=
.h:29 include/linux/atomic/atomic-instrumented.h:28 include/asm-generic/qsp=
inlock.h:28 kernel/locking/spinlock_debug.c:100 kernel/locking/spinlock_deb=
ug.c:140)
>>> [ 103.701094][ T2443] ? syscall_exit_to_user_mode (kernel/entry/common.=
c:129 kernel/entry/common.c:296)
>>> [ 103.706539][ T2443] ? lockdep_hardirqs_on_prepare (kernel/locking/loc=
kdep.c:4501)
>>> [ 103.712929][ T2443] ? do_syscall_64 (arch/x86/entry/common.c:87)
>>> [ 103.717343][ T2443] ? lockdep_hardirqs_on_prepare (kernel/locking/loc=
kdep.c:4501)
>>> [ 103.723747][ T2443] entry_SYSCALL_64_after_hwframe (arch/x86/entry/en=
try_64.S:115)
>>> [=C2=A0 103.729451][ T2443] RIP: 0033:0x7f1020308f33
>>> [ 103.733709][ T2443] Code: 8b 15 61 ef 0c 00 f7 d8 64 89 02 48 c7 c0 f=
f ff ff ff eb b7 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 01 00 00 0=
0 0f 05 <48> 3d 00 f0 ff ff 77 55 c3 0f 1f 40 00 48 83 ec 28 48 89 54 24 18
>>> All code
>>> =3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0 8b 15 61 ef 0c 00=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 0xcef61(%rip),%edx=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # 0xcef67
>>> =C2=A0=C2=A0=C2=A0 6:=C2=A0=C2=A0=C2=A0 f7 d8=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 neg=C2=A0=C2=A0=C2=A0 %eax
>>> =C2=A0=C2=A0=C2=A0 8:=C2=A0=C2=A0=C2=A0 64 89 02=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 mov=C2=A0=C2=A0=C2=A0 %eax,%fs:(%rdx)
>>> =C2=A0=C2=A0=C2=A0 b:=C2=A0=C2=A0=C2=A0 48 c7 c0 ff ff ff ff=C2=A0=C2=
=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 $0xffffffffffffffff,%rax
>>> =C2=A0=C2=A0 12:=C2=A0=C2=A0=C2=A0 eb b7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 jmp=C2=A0=C2=A0=C2=A0 0xffffffffffffffcb
>>> =C2=A0=C2=A0 14:=C2=A0=C2=A0=C2=A0 0f 1f 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nopl=
=C2=A0=C2=A0 (%rax)
>>> =C2=A0=C2=A0 17:=C2=A0=C2=A0=C2=A0 64 8b 04 25 18 00 00=C2=A0=C2=A0=C2=
=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %fs:0x18,%eax
>>> =C2=A0=C2=A0 1e:=C2=A0=C2=A0=C2=A0 00
>>> =C2=A0=C2=A0 1f:=C2=A0=C2=A0=C2=A0 85 c0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 test=C2=A0=C2=A0 %eax,%eax
>>> =C2=A0=C2=A0 21:=C2=A0=C2=A0=C2=A0 75 14=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 jne=C2=A0=C2=A0=C2=A0 0x37
>>> =C2=A0=C2=A0 23:=C2=A0=C2=A0=C2=A0 b8 01 00 00 00=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 $0x1,%eax
>>> =C2=A0=C2=A0 28:=C2=A0=C2=A0=C2=A0 0f 05=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 syscall
>>> =C2=A0=C2=A0 2a:*=C2=A0=C2=A0=C2=A0 48 3d 00 f0 ff ff=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 cmp=C2=A0=C2=A0=C2=A0 $0xfffffffffffff000,%rax=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <-- trapping instruction
>>> =C2=A0=C2=A0 30:=C2=A0=C2=A0=C2=A0 77 55=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ja=C2=A0=C2=A0=C2=A0=C2=A0 0x87
>>> =C2=A0=C2=A0 32:=C2=A0=C2=A0=C2=A0 c3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 retq
>>> =C2=A0=C2=A0 33:=C2=A0=C2=A0=C2=A0 0f 1f 40 00=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nopl=C2=A0=C2=A0 0x0=
(%rax)
>>> =C2=A0=C2=A0 37:=C2=A0=C2=A0=C2=A0 48 83 ec 28=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sub=C2=A0=C2=A0=C2=
=A0 $0x28,%rsp
>>> =C2=A0=C2=A0 3b:=C2=A0=C2=A0=C2=A0 48 89 54 24 18=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %rdx,0x18(%rs=
p)
>>>
>>> Code starting with the faulting instruction
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> =C2=A0=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0 48 3d 00 f0 ff ff=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmp=C2=A0=C2=A0=C2=A0 $0xfffffffffffff000,%r=
ax
>>> =C2=A0=C2=A0=C2=A0 6:=C2=A0=C2=A0=C2=A0 77 55=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ja=C2=A0=C2=A0=C2=A0=C2=A0 0x5d
>>> =C2=A0=C2=A0=C2=A0 8:=C2=A0=C2=A0=C2=A0 c3=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retq
>>> =C2=A0=C2=A0=C2=A0 9:=C2=A0=C2=A0=C2=A0 0f 1f 40 00=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nopl=C2=A0=C2=
=A0 0x0(%rax)
>>> =C2=A0=C2=A0=C2=A0 d:=C2=A0=C2=A0=C2=A0 48 83 ec 28=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sub=C2=A0=C2=
=A0=C2=A0 $0x28,%rsp
>>> =C2=A0=C2=A0 11:=C2=A0=C2=A0=C2=A0 48 89 54 24 18=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %rdx,0x18(%rs=
p)
>>> [=C2=A0 103.753040][ T2443] RSP: 002b:00007fffe4075988 EFLAGS: 00000246=
 ORIG_RAX: 0000000000000001
>>> [=C2=A0 103.761244][ T2443] RAX: ffffffffffffffda RBX: 0000000000000003=
 RCX: 00007f1020308f33
>>> [=C2=A0 103.769013][ T2443] RDX: 0000000000000003 RSI: 00005582df845b80=
 RDI: 0000000000000001
>>> [=C2=A0 103.776791][ T2443] RBP: 00005582df845b80 R08: 00000000ffffffff=
 R09: 0000000000000003
>>> [=C2=A0 103.784561][ T2443] R10: 00005582df833c80 R11: 0000000000000246=
 R12: 0000000000000003
>>> [=C2=A0 103.792328][ T2443] R13: 00007f10203d96a0 R14: 0000000000000003=
 R15: 00007f10203d98a0
>>> [=C2=A0 103.800100][ T2443]=C2=A0 </TASK>
>>> [=C2=A0 103.802957][ T2443]
>>> [=C2=A0 103.805125][ T2443] Allocated by task 2443:
>>> [ 103.809276][ T2443] kasan_save_stack (mm/kasan/common.c:39)
>>> [ 103.813781][ T2443] __kasan_kmalloc (mm/kasan/common.c:45 mm/kasan/co=
mmon.c:436 mm/kasan/common.c:515 mm/kasan/common.c:524)
>>> [ 103.818190][ T2443] firmware_upload_register (drivers/base/firmware_l=
oader/sysfs_upload.c:160)
>>> [ 103.824150][ T2443] upload_register_store (lib/test_firmware.c:1279)
>>> [ 103.829250][ T2443] kernfs_fop_write_iter (fs/kernfs/file.c:294)
>>> [ 103.834350][ T2443] new_sync_write (fs/read_write.c:505 (discriminato=
r 1))
>>> [ 103.838846][ T2443] vfs_write (fs/read_write.c:591)
>>> [ 103.842910][ T2443] ksys_write (fs/read_write.c:644)
>>> [ 103.846975][ T2443] do_syscall_64 (arch/x86/entry/common.c:50 arch/x8=
6/entry/common.c:80)
>>> [ 103.851217][ T2443] entry_SYSCALL_64_after_hwframe (arch/x86/entry/en=
try_64.S:115)
>>> [=C2=A0 103.856932][ T2443]
>>> [=C2=A0 103.859100][ T2443] Freed by task 2443:
>>> [ 103.862907][ T2443] kasan_save_stack (mm/kasan/common.c:39)
>>> [ 103.867415][ T2443] kasan_set_track (mm/kasan/common.c:45)
>>> [ 103.871822][ T2443] kasan_set_free_info (mm/kasan/generic.c:372)
>>> [ 103.876579][ T2443] __kasan_slab_free (mm/kasan/common.c:368 mm/kasan=
/common.c:328 mm/kasan/common.c:374)
>>> [ 103.881331][ T2443] slab_free_freelist_hook (mm/slub.c:1754)
>>> [ 103.886517][ T2443] kfree (mm/slub.c:3510 mm/slub.c:4552)
>>> [ 103.890156][ T2443] fw_dev_release (drivers/base/firmware_loader/sysf=
s.c:102)
>>> [ 103.894483][ T2443] device_release (drivers/base/core.c:2235)
>>> [ 103.898902][ T2443] kobject_cleanup (lib/kobject.c:677)
>>> [ 103.903492][ T2443] firmware_upload_unregister (drivers/base/firmware=
_loader/sysfs_upload.c:395)
>>> [ 103.909034][ T2443] upload_unregister_store (lib/test_firmware.c:1060=
 lib/test_firmware.c:1321)
>>> [ 103.914311][ T2443] kernfs_fop_write_iter (fs/kernfs/file.c:294)
>>> [ 103.919429][ T2443] new_sync_write (fs/read_write.c:505 (discriminato=
r 1))
>>> [ 103.923927][ T2443] vfs_write (fs/read_write.c:591)
>>> [ 103.927990][ T2443] ksys_write (fs/read_write.c:644)
>>> [ 103.932054][ T2443] do_syscall_64 (arch/x86/entry/common.c:50 arch/x8=
6/entry/common.c:80)
>>> [ 103.936290][ T2443] entry_SYSCALL_64_after_hwframe (arch/x86/entry/en=
try_64.S:115)
>>> [=C2=A0 103.941992][ T2443]
>>> [=C2=A0 103.944159][ T2443] Last potentially related work creation:
>>> [ 103.949704][ T2443] kasan_save_stack (mm/kasan/common.c:39)
>>> [ 103.954216][ T2443] __kasan_record_aux_stack (mm/kasan/generic.c:348)
>>> [ 103.959400][ T2443] insert_work (include/linux/instrumented.h:71 incl=
ude/asm-generic/bitops/instrumented-non-atomic.h:134 kernel/workqueue.c:635=
 kernel/workqueue.c:642 kernel/workqueue.c:1361)
>>> [ 103.963552][ T2443] __queue_work (kernel/workqueue.c:1520)
>>> [ 103.967888][ T2443] queue_work_on (kernel/workqueue.c:1546)
>>> [ 103.972141][ T2443] fw_upload_start (drivers/base/firmware_loader/sys=
fs_upload.c:263)
>>> [ 103.976723][ T2443] firmware_loading_store (drivers/base/firmware_loa=
der/sysfs.c:213)
>>> [ 103.981910][ T2443] kernfs_fop_write_iter (fs/kernfs/file.c:294)
>>> [ 103.987022][ T2443] new_sync_write (fs/read_write.c:505 (discriminato=
r 1))
>>> [ 103.991537][ T2443] vfs_write (fs/read_write.c:591)
>>> [ 103.995604][ T2443] ksys_write (fs/read_write.c:644)
>>> [ 103.999673][ T2443] do_syscall_64 (arch/x86/entry/common.c:50 arch/x8=
6/entry/common.c:80)
>>> [ 104.003930][ T2443] entry_SYSCALL_64_after_hwframe (arch/x86/entry/en=
try_64.S:115)
>>> [=C2=A0 104.009631][ T2443]
>>> [=C2=A0 104.011800][ T2443] Second to last potentially related work cre=
ation:
>>> [ 104.018219][ T2443] kasan_save_stack (mm/kasan/common.c:39)
>>> [ 104.022727][ T2443] __kasan_record_aux_stack (mm/kasan/generic.c:348)
>>> [ 104.027938][ T2443] insert_work (include/linux/instrumented.h:71 incl=
ude/asm-generic/bitops/instrumented-non-atomic.h:134 kernel/workqueue.c:635=
 kernel/workqueue.c:642 kernel/workqueue.c:1361)
>>> [ 104.032101][ T2443] __queue_work (kernel/workqueue.c:1520)
>>> [ 104.036423][ T2443] queue_work_on (kernel/workqueue.c:1546)
>>> [ 104.040658][ T2443] fw_upload_start (drivers/base/firmware_loader/sys=
fs_upload.c:263)
>>> [ 104.045240][ T2443] firmware_loading_store (drivers/base/firmware_loa=
der/sysfs.c:213)
>>> [ 104.050423][ T2443] kernfs_fop_write_iter (fs/kernfs/file.c:294)
>>> [ 104.055522][ T2443] new_sync_write (fs/read_write.c:505 (discriminato=
r 1))
>>> [ 104.060016][ T2443] vfs_write (fs/read_write.c:591)
>>> [ 104.064081][ T2443] ksys_write (fs/read_write.c:644)
>>> [ 104.068144][ T2443] do_syscall_64 (arch/x86/entry/common.c:50 arch/x8=
6/entry/common.c:80)
>>> [ 104.072381][ T2443] entry_SYSCALL_64_after_hwframe (arch/x86/entry/en=
try_64.S:115)
>>> [=C2=A0 104.078083][ T2443]
>>> [=C2=A0 104.080249][ T2443] The buggy address belongs to the object at =
ffff8881e186c800
>>> [=C2=A0 104.080249][ T2443]=C2=A0 which belongs to the cache kmalloc-51=
2 of size 512
>>> [=C2=A0 104.094049][ T2443] The buggy address is located 8 bytes inside=
 of
>>> [=C2=A0 104.094049][ T2443]=C2=A0 512-byte region [ffff8881e186c800, ff=
ff8881e186ca00)
>>> [=C2=A0 104.106914][ T2443]
>>> [=C2=A0 104.109084][ T2443] The buggy address belongs to the physical p=
age:
>>> [=C2=A0 104.115315][ T2443] page:0000000037a5888d refcount:1 mapcount:0=
 mapping:0000000000000000 index:0x0 pfn:0x1e1868
>>> [=C2=A0 104.125336][ T2443] head:0000000037a5888d order:3 compound_mapc=
ount:0 compound_pincount:0
>>> [=C2=A0 104.133454][ T2443] flags: 0x17ffffc0010200(slab|head|node=3D0|=
zone=3D2|lastcpupid=3D0x1fffff)
>>> [=C2=A0 104.141498][ T2443] raw: 0017ffffc0010200 ffffea0005491e00 dead=
000000000002 ffff888100042c80
>>> [=C2=A0 104.149885][ T2443] raw: 0000000000000000 0000000000200020 0000=
0001ffffffff 0000000000000000
>>> [=C2=A0 104.158274][ T2443] page dumped because: kasan: bad access dete=
cted
>>> [=C2=A0 104.164492][ T2443]
>>>
>>>
>>> To reproduce:
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://gith=
ub.com/intel/lkp-tests.git
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp install j=
ob.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # job f=
ile is attached in this email
>> I have tried these steps on Fedora35 and on CentOS Stream. In both
>> cases I have missing packages that I have not yet resolved:
>>
>> Error: Unable to find a match: arping lib32gcc-dev libc6-dev-i386 libc6-=
i386 libc6-x32 libhugetlbfs-dev libmnl-dev libmount-dev libpci3 libreadline=
-dev libx32asan5 libx32atomic1 libx32gcc1 libx32gcc-dev libx32gomp1 libx32i=
tm1 libx32quadmath0 libx32ubsan1 linux-libc-dev-amd64-cross netcat-openbsd =
openvswitch-common openvswitch-switch sendip libpci-dev
>>
>> Simply running the fw_upload selftests in a loop is not sufficient to
>> trigger the error. Can you provide additional instructions for
>> running the lkp tests manually? Do I need a specific OS? How can I
>> access the missing packages?
>
> We can reproduce this error on bare metal by simply running fw_upload.sh.
>
> ~/linux/tools/testing/selftests/firmware# ./fw_upload.sh
> ./fw_upload.sh: firmware upload cancellation works
> ./fw_upload.sh: firmware upload error handling works
> ./fw_upload.sh: oversized firmware error handling works
> ./fw_upload.sh: firmware upload for fw1 works
> ./fw_upload.sh: firmware upload for fw2 works
> ./fw_upload.sh: firmware upload for fw3 works
>
> Message from syslogd(a)debian-x8664 at Sep=C2=A0 1 05:06:54 ...
> =C2=A0kernel:[ 1090.872590][ T1293] Kernel panic - not syncing: Fatal exc=
eption
>
> dmesg read from serial:
>
> [ 1089.654274][ T1293] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [ 1089.662192][ T1293] BUG: KASAN: use-after-free in firmware_upload_unre=
gister+0x16e/0x1c0
> [ 1089.670282][ T1293] Read of size 8 at addr ffff88873a872008 by task fw=
_upload.sh/1293
> [ 1089.678107][ T1293]
> [ 1089.680291][ T1293] CPU: 4 PID: 1293 Comm: fw_upload.sh Not tainted 5.=
18.0-rc2-00036-ga37ddddd8603 #1
> [ 1089.689527][ T1293] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIO=
S 1.2.8 01/26/2016
> [ 1089.697612][ T1293] Call Trace:
> [ 1089.700751][ T1293]=C2=A0 <TASK>
> [ 1089.703557][ T1293]=C2=A0 ? firmware_upload_unregister+0x16e/0x1c0
> [ 1089.709313][ T1293]=C2=A0 dump_stack_lvl+0x45/0x59
> [ 1089.713669][ T1293]=C2=A0 print_address_description.constprop.0+0x1f/0=
x200
> [ 1089.720107][ T1293]=C2=A0 ? firmware_upload_unregister+0x16e/0x1c0
> [ 1089.725851][ T1293]=C2=A0 print_report.cold+0x55/0x22c
> [ 1089.730556][ T1293]=C2=A0 ? do_raw_spin_lock+0x12e/0x280
> [ 1089.735432][ T1293]=C2=A0 kasan_report+0xbe/0x1c0
>
>
> Could you please help check if the .config file used to compile the kernel
> matches the one we attached in the original report? Here we attach it aga=
in
> for your reference.
>
>
> About the issue of missing packages during setting up lkp test environmen=
t,
> we wish to support various OS and distributions, but sometimes our package
> dependencies are not updated in time, sorry for the inconvenience. We use
> debian OS in our test environment, and it can install the required packag=
es
> successfully. We will fix the package issue on other OS soon. For this ca=
se,
> we still recommend to run fw_upload.sh to trigger the error, because it's
> much easier than setting up lkp tests environment.
>
> -- =

> Thanks,
> Yujie
>
>>
>> Thanks,
>> - Russ
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp split-job --co=
mpatible job.yaml # generate the yaml file for lkp run
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp run gener=
ated-yaml-file
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # if come across any f=
ailure that blocks the test,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # please remove ~/.lkp=
 and /lkp dir to run from a clean state.
>>>
>>>
>>>
>>

--===============7316867668988783718==--

