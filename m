Content-Type: multipart/mixed; boundary="===============4414049026892288204=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 6128b3af2a: UBSAN:shift-out-of-bounds_in(null)
Date: Wed, 20 Oct 2021 22:13:41 +0800
Message-ID: <20211020141341.GA22721@xsang-OptiPlex-9020>
In-Reply-To: <99b496b7-c465-eac3-d7ad-18a615fe94a7@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4414049026892288204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, David, Hi, Eric,

On Wed, Oct 20, 2021 at 09:22:52AM +0200, David Hildenbrand wrote:
> On 19.10.21 17:49, Eric W. Biederman wrote:
> > kernel test robot <oliver.sang@intel.com> writes:
> > =

> >> Greeting,
> >>
> >> FYI, we noticed the following commit (built with clang-14):
> >>
> >> commit: 6128b3af2a5e42386aa7faf37609b57f39fb7d00 ("mm: ignore MAP_DENY=
WRITE in ksys_mmap_pgoff()")
> >> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> > =

> > I believe this failure is misattributed.  Perhaps your reproducer
> > only intermittently reproduces the problem?

yes, we only reproduce the problem intermittently, those 9 instances are
out of 115 runs.
8d0920bde5eb8ec7 6128b3af2a5e42386aa7faf3760
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :115          8%           9:115   dmesg.UBSAN:shift-out-of-boun=
ds_in(null)    <--


> > =

> > The change in question only contains
> > =

> > 	flags &=3D ~MAP_DENYWRITE
> > =

> > After all of the other users of MAP_DENYWRITE had been removed from the
> > kernel.  So I don't see how it could possibly be responsible for the
> > reported shift out of bounds problem.
> > =

> > Eric
> =

> Thanks for looking into this Eric while I spent the last couple of days
> in bed feeling miserable. :)
> =

> =

> So we get 9 new instances of "UBSAN:shift-out-of-bounds_in(null)" (NULL
> pointer dereference) on 6128b3af2a compared to 6128b3af2a^ (8d0920bde5),
> apparently inside ksys_mmap_pgoff() on 32bit.
> =

> As we're dealing with a fuzzer, is there any reproducer as sometimes
> provided by syzkaller? The report itself is not very helpful when
> judging if that patch is actually responsible for what we're seeing.
> =

> I agree with Eric that it's rather unlikely that when we stop masking
> off a bit that's ignored throughout the kernel, that we suddenly trigger
> a NULL pointer de-reference. But I learned that everything is possible ;)


now we run parent 200 more times, the "UBSAN:shift-out-of-bounds_in(null)" =
(1)
still cannot be reproduced on parent:
8d0920bde5eb8ec7 6128b3af2a5e42386aa7faf3760
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
            |             |             |
         45:315        -11%           9:115   dmesg.BUG:kernel_NULL_pointer=
_dereference,address
           :315          3%           8:115   dmesg.BUG:unable_to_handle_pa=
ge_fault_for_address
         45:315         -9%          17:115   dmesg.EIP:__ubsan_handle_shif=
t_out_of_bounds <--(2)
         45:315         -9%          17:115   dmesg.Kernel_panic-not_syncin=
g:Fatal_exception
         45:315         -9%          17:115   dmesg.Oops:#[##]
           :315          3%           9:115   dmesg.UBSAN:shift-out-of-boun=
ds_in(null)  <--(1)
         45:315         -9%          17:115   dmesg.boot_failures


however, from above (2), we found parent dmesg (attached) has similar
Call Trace, which just does't have "UBSAN:shift-out-of-bounds_in(null)"
things:
[  272.487295][ T7295] BUG: kernel NULL pointer dereference, address: 00000=
00c
[  272.488078][ T7295] #PF: supervisor read access in kernel mode
[  272.488673][ T7295] #PF: error_code(0x0000) - not-present page
[  272.489266][ T7295] *pde =3D 00000000
[  272.489751][ T7295] Oops: 0000 [#1] SMP
[  272.490165][ T7295] CPU: 1 PID: 7295 Comm: trinity-c2 Not tainted 5.14.0=
-00005-g8d0920bde5eb #1
[  272.491122][ T7295] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS 1.12.0-1 04/01/2014
[  272.492067][ T7295] EIP: __ubsan_handle_shift_out_of_bounds+0xe/0x350
[  272.492760][ T7295] Code: 05 90 a6 c2 00 68 2a 54 00 68 2a 54 bd 4e 00 8=
d bd 4e 00 8d 00 00 66 90 00 00 66 90 57 56 83 ec 57 56 83 ec 89 c7 8b 48 8=
9 c7 <8b> 48 8d\
 b4 26 00 8d b4 26 00 75 b4 64 8b 75 b4 64 8b ca 83 bb 1c
[  272.494890][ T7295] EAX: 00000000 EBX: c5d6cf38 ECX: 00000031 EDX: 00000=
000
[  272.495686][ T7295] ESI: f138eb71 EDI: 00000000 EBP: f5a23f3c ESP: f5a23=
ec8
[  272.496532][ T7295] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS:=
 00010292
[  272.497383][ T7295] CR0: 80050033 CR2: 0000000c CR3: 3528d000 CR4: 00040=
6d0
[  272.498152][ T7295] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000=
000
[  272.498897][ T7295] DR6: fffe0ff0 DR7: 00000400
[  272.499411][ T7295] Call Trace:
[  272.499827][ T7295]  ? __lock_acquire+0x955/0xb80
[  272.500361][ T7295]  ? rcu_lock_acquire+0x30/0x30
[  272.500875][ T7295]  ? rcu_read_lock_sched_held+0x31/0x70
[  272.501500][ T7295]  ksys_mmap_pgoff+0x1fd/0x290
[  272.501990][ T7295]  __ia32_sys_mmap_pgoff+0x1c/0x30
[  272.502512][ T7295]  do_int80_syscall_32+0x39/0x80
[  272.503101][ T7295]  entry_INT80_32+0x10d/0x10d
[  272.503624][ T7295] EIP: 0xb7f71a02
[  272.504029][ T7295] Code: 95 01 00 05 25 36 02 00 83 ec 14 8d 80 e8 99 f=
f ff 50 6a 02 e8 1f ff 00 00 c7 04 24 7f 00 00 00 e8 7e 87 01 00 66 90 90 c=
d 80 <c3> 8d b6 00 00 00 00 8d bc 27 00 00 00 00 8b 1c 24 c3 8d b6 00 00
[  272.506044][ T7295] EAX: ffffffda EBX: 00000000 ECX: 00000000 EDX: f138e=
b71
[  272.506825][ T7295] ESI: c5d6cf38 EDI: ffffffff EBP: 00000000 ESP: bfca5=
4d8
[  272.507592][ T7295] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS:=
 00000296
[  272.508417][ T7295] Modules linked in: aesni_intel crypto_simd qemu_fw_c=
fg autofs4
[  272.509201][ T7295] CR2: 000000000000000c
[  272.509704][ T7295] ---[ end trace 97b48cc676da14f9 ]---
[  272.510293][ T7295] EIP: __ubsan_handle_shift_out_of_bounds+0xe/0x350
[  272.511023][ T7295] Code: 05 90 a6 c2 00 68 2a 54 00 68 2a 54 bd 4e 00 8=
d bd 4e 00 8d 00 00 66 90 00 00 66 90 57 56 83 ec 57 56 83 ec 89 c7 8b 48 8=
9 c7 <8b> 48 8d b4 26 00 8d b4 26 00 75 b4 64 8b 75 b4 64 8b ca 83 bb 1c
[  272.513169][ T7295] EAX: 00000000 EBX: c5d6cf38 ECX: 00000031 EDX: 00000=
000
[  272.513979][ T7295] ESI: f138eb71 EDI: 00000000 EBP: f5a23f3c ESP: f5a23=
ec8
[  272.514800][ T7295] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS:=
 00010292
[  272.515974][ T7295] CR0: 80050033 CR2: 0000000c CR3: 3528d000 CR4: 00040=
6d0
[  272.516787][ T7295] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000=
000
[  272.517619][ T7295] DR6: fffe0ff0 DR7: 00000400
[  272.518105][ T7295] Kernel panic - not syncing: Fatal exception
[  272.519566][ T7295] Kernel Offset: disabled


as contrast, in fbc:
[  126.758570][ T3293] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  126.758949][ T3293] UBSAN: shift-out-of-bounds in (null):0:0
[  126.759174][ T3293] BUG: kernel NULL pointer dereference, address: 00000=
000
[  126.759447][ T3293] #PF: supervisor read access in kernel mode
[  126.759676][ T3293] #PF: error_code(0x0000) - not-present page
[  126.759905][ T3293] *pde =3D 00000000
[  126.760047][ T3293] Oops: 0000 [#1] SMP
[  126.760205][ T3293] CPU: 1 PID: 3293 Comm: trinity-c4 Not tainted 5.14.0=
-00006-g6128b3af2a5e #1
[  126.760541][ T3293] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS 1.12.0-1 04/01/2014
[  126.760890][ T3293] EIP: __ubsan_handle_shift_out_of_bounds+0x88/0x350
[  126.761147][ T3293] Code: 00 83 c4 04 7f 23 47 04 7f 23 47 04 ff 37 68 e=
f ff 37 68 ef e3 77 d0 d7 e3 77 d0 d7 00 8b 45 f0 00 8b 45 f0 c4 14 66 83 c=
4 14 <66> 83 66
83 3f 00 66 83 3f 00 00 00 66 83 00 00 66 83 b9 01 00 00
[  126.761889][ T3293] EAX: 00000000 EBX: f345b500 ECX: 00000027 EDX: eba9c=
e40
[  126.762159][ T3293] ESI: 00000046 EDI: 00000000 EBP: f3575f40 ESP: f3575=
ecc
[  126.762428][ T3293] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS:=
 00010286
[  126.762718][ T3293] CR0: 80050033 CR2: 00000000 CR3: 33464000 CR4: 00040=
6d0
[  126.762989][ T3293] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000=
000
[  126.763259][ T3293] DR6: fffe0ff0 DR7: 00000400
[  126.763436][ T3293] Call Trace:
[  126.763562][ T3293]  ? rcu_lock_acquire+0x30/0x30
[  126.763749][ T3293]  ? rcu_read_lock_sched_held+0x31/0x70
[  126.763960][ T3293]  ksys_mmap_pgoff+0x1fc/0x290
[  126.764146][ T3293]  __ia32_sys_mmap_pgoff+0x1c/0x30
[  126.764343][ T3293]  do_int80_syscall_32+0x39/0x80
[  126.764532][ T3293]  entry_INT80_32+0x10d/0x10d
[  126.764709][ T3293] EIP: 0xb7fbda02
[  126.764848][ T3293] Code: 95 01 00 05 25 36 02 00 83 ec 14 8d 80 e8 99 f=
f ff 50 6a 02 e8 1f ff 00 00 c7 04 24 7f 00 00 00 e8 7e 87 01 00 66 90 90 c=
d 80 <c3> 8d b6
00 00 00 00 8d bc 27 00 00 00 00 8b 1c 24 c3 8d b6 00 00
[  126.765591][ T3293] EAX: ffffffda EBX: 00000000 ECX: 00001000 EDX: 55dd7=
eb6
[  126.765859][ T3293] ESI: f0bd6374 EDI: ffffffff EBP: 00000000 ESP: bf996=
4d8
[  126.766129][ T3293] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS:=
 00000296
[  126.766419][ T3293] Modules linked in: aesni_intel crypto_simd qemu_fw_c=
fg autofs4
[  126.766715][ T3293] CR2: 0000000000000000
[  126.766894][ T3293] ---[ end trace e6000e119f0dc7f3 ]---
[  126.767105][ T3293] EIP: __ubsan_handle_shift_out_of_bounds+0x88/0x350
[  126.767361][ T3293] Code: 00 83 c4 04 7f 23 47 04 7f 23 47 04 ff 37 68 e=
f ff 37 68 ef e3 77 d0 d7 e3 77 d0 d7 00 8b 45 f0 00 8b 45 f0 c4 14 66 83 c=
4 14 <66> 83 66
+83 3f 00 66 83 3f 00 00 00 66 83 00 00 66 83 b9 01 00 00
[  126.768112][ T3293] EAX: 00000000 EBX: f345b500 ECX: 00000027 EDX: eba9c=
e40
[  126.768384][ T3293] ESI: 00000046 EDI: 00000000 EBP: f3575f40 ESP: f3575=
ecc
[  126.768657][ T3293] DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS:=
 00010286
[  126.768947][ T3293] CR0: 80050033 CR2: 00000000 CR3: 33464000 CR4: 00040=
6d0
[  126.769223][ T3293] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000=
000
[  126.769496][ T3293] DR6: fffe0ff0 DR7: 00000400
[  126.769680][ T3293] Kernel panic - not syncing: Fatal exception
[  126.769946][ T3293] Kernel Offset: disabled


basically, we just based on the diff to report out, but maybe need your edu=
cation
if this "UBSAN:shift-out-of-bounds_in(null)" diff really matter in this cas=
e.


> =

> -- =

> Thanks,
> =

> David / dhildenb
>=20

--===============4414049026892288204==
Content-Type: application/x-xz
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="dmesg-parent.xz"

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
igGv3gQrPodQscRn+wIAAAAABFla
--===============4414049026892288204==--

