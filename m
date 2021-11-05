Content-Type: multipart/mixed; boundary="===============5275818753636082228=="
MIME-Version: 1.0
From: Daniel Borkmann <daniel@iogearbox.net>
To: lkp@lists.01.org
Subject: Re: [net, neigh] 7482e3841d: BUG:unable_to_handle_page_fault_for_address
Date: Fri, 05 Nov 2021 12:21:20 +0100
Message-ID: <d70dcff2-e7c7-d909-b718-0b7f970b3c17@iogearbox.net>
In-Reply-To: <2795a2ab-b036-9743-6ce9-9e73683ad5f0@iogearbox.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5275818753636082228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hey Oliver,

On 11/4/21 4:35 PM, Daniel Borkmann wrote:
> On 11/4/21 4:21 PM, kernel test robot wrote:
>>
>> Greeting,
>>
>> FYI, we noticed the following commit (built with gcc-9):
>>
>> commit: 7482e3841d520a368426ac196720601687e2dc47 ("net, neigh: Add NTF_M=
ANAGED flag for managed neighbor entries")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: boot
>>
>> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m=
 4G
>>
>> caused below changes (please refer to attached dmesg/kmsg for entire log=
/backtrace):
> =

> Thanks, I'll take a look at the reproducer!
> =

>> +-------------------------------------------------------+------------+--=
----------+
>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2c611ad97a | 7482e3841d |
>> +-------------------------------------------------------+------------+--=
----------+
>> | boot_failures=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 15=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> | BUG:unable_to_handle_page_fault_for_address=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 15=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> | Oops:#[##]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |
>> | EIP:run_timer_softirq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> | EIP:_raw_spin_unlock_irqrestore=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> | Kernel_panic-not_syncing:Fatal_exception_in_interrupt | 0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 15=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>> +-------------------------------------------------------+------------+--=
----------+
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>
>>
>> [=C2=A0=C2=A0 36.043298][=C2=A0=C2=A0=C2=A0 C0] BUG: unable to handle pa=
ge fault for address: f7a5c288
>> [=C2=A0=C2=A0 36.044351][=C2=A0=C2=A0=C2=A0 C0] #PF: supervisor write ac=
cess in kernel mode
>> [=C2=A0=C2=A0 36.044975][=C2=A0=C2=A0=C2=A0 C0] #PF: error_code(0x0002) =
- not-present page
>> [=C2=A0=C2=A0 36.045876][=C2=A0=C2=A0=C2=A0 C0] *pde =3D 063ad067 *pte =
=3D 00000000
>> [=C2=A0=C2=A0 36.046763][=C2=A0=C2=A0=C2=A0 C0] Oops: 0002 [#1]
>> [=C2=A0=C2=A0 36.047362][=C2=A0=C2=A0=C2=A0 C0] CPU: 0 PID: 240 Comm: sy=
stemd-udevd Not tainted 5.15.0-rc4-01167-g7482e3841d52 #1
>> [=C2=A0=C2=A0 36.048619][=C2=A0=C2=A0=C2=A0 C0] Hardware name: QEMU Stan=
dard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
>> [ 36.049966][ C0] EIP: run_timer_softirq (include/linux/list.h:968 kerne=
l/time/timer.c:1487 kernel/time/timer.c:1723 kernel/time/timer.c:1747)
>> [ 36.052089][ C0] Code: 00 00 8d 4d d0 8d 76 00 89 d0 83 e0 3f 01 d8 0f =
b3 05 00 08 ca c2 73 28 c1 e0 02 8d 79 04 8b b0 48 08 ca c2 89 31 85 f6 74 =
03 <89> 4e 04 8b 4d cc c7 80 48 08 ca c2 00 00 00 00 41 89 4d cc 89 f9
>> All code
>> =3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0 00 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0 %al,(%rax)
>> =C2=A0=C2=A0=C2=A0 2:=C2=A0=C2=A0=C2=A0 8d 4d d0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 le=
a=C2=A0=C2=A0=C2=A0 -0x30(%rbp),%ecx
>> =C2=A0=C2=A0=C2=A0 5:=C2=A0=C2=A0=C2=A0 8d 76 00=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 le=
a=C2=A0=C2=A0=C2=A0 0x0(%rsi),%esi
>> =C2=A0=C2=A0=C2=A0 8:=C2=A0=C2=A0=C2=A0 89 d0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %edx,%eax
>> =C2=A0=C2=A0=C2=A0 a:=C2=A0=C2=A0=C2=A0 83 e0 3f=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 an=
d=C2=A0=C2=A0=C2=A0 $0x3f,%eax
>> =C2=A0=C2=A0=C2=A0 d:=C2=A0=C2=A0=C2=A0 01 d8=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0 %ebx,%eax
>> =C2=A0=C2=A0=C2=A0 f:=C2=A0=C2=A0=C2=A0 0f b3 05 00 08 ca c2=C2=A0=C2=A0=
=C2=A0=C2=A0 btr=C2=A0=C2=A0=C2=A0 %eax,-0x3d35f800(%rip)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # 0xffffffffc2ca0816
>> =C2=A0=C2=A0 16:=C2=A0=C2=A0=C2=A0 73 28=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 jae=C2=A0=C2=A0=C2=A0 0x40
>> =C2=A0=C2=A0 18:=C2=A0=C2=A0=C2=A0 c1 e0 02=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shl=
=C2=A0=C2=A0=C2=A0 $0x2,%eax
>> =C2=A0=C2=A0 1b:=C2=A0=C2=A0=C2=A0 8d 79 04=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lea=
=C2=A0=C2=A0=C2=A0 0x4(%rcx),%edi
>> =C2=A0=C2=A0 1e:=C2=A0=C2=A0=C2=A0 8b b0 48 08 ca c2=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 -0x3d35f7b8(%rax),%esi
>> =C2=A0=C2=A0 24:=C2=A0=C2=A0=C2=A0 89 31=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %esi,(%rcx)
>> =C2=A0=C2=A0 26:=C2=A0=C2=A0=C2=A0 85 f6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 test=C2=A0=C2=A0 %esi,%esi
>> =C2=A0=C2=A0 28:=C2=A0=C2=A0=C2=A0 74 03=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 je=C2=A0=C2=A0=C2=A0=C2=A0 0x2d
>> =C2=A0=C2=A0 2a:*=C2=A0=C2=A0=C2=A0 89 4e 04=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=
=C2=A0=C2=A0=C2=A0 %ecx,0x4(%rsi)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 <-- trapping instruction
>> =C2=A0=C2=A0 2d:=C2=A0=C2=A0=C2=A0 8b 4d cc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=
=C2=A0=C2=A0=C2=A0 -0x34(%rbp),%ecx
>> =C2=A0=C2=A0 30:=C2=A0=C2=A0=C2=A0 c7 80 48 08 ca c2 00=C2=A0=C2=A0=C2=
=A0=C2=A0 movl=C2=A0=C2=A0 $0x0,-0x3d35f7b8(%rax)
>> =C2=A0=C2=A0 37:=C2=A0=C2=A0=C2=A0 00 00 00
>> =C2=A0=C2=A0 3a:=C2=A0=C2=A0=C2=A0 41 89 4d cc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=
=A0 %ecx,-0x34(%r13)
>> =C2=A0=C2=A0 3e:=C2=A0=C2=A0=C2=A0 89 f9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %edi,%ecx
>>
>> Code starting with the faulting instruction
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0 89 4e 04=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mo=
v=C2=A0=C2=A0=C2=A0 %ecx,0x4(%rsi)
>> =C2=A0=C2=A0=C2=A0 3:=C2=A0=C2=A0=C2=A0 8b 4d cc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mo=
v=C2=A0=C2=A0=C2=A0 -0x34(%rbp),%ecx
>> =C2=A0=C2=A0=C2=A0 6:=C2=A0=C2=A0=C2=A0 c7 80 48 08 ca c2 00=C2=A0=C2=A0=
=C2=A0=C2=A0 movl=C2=A0=C2=A0 $0x0,-0x3d35f7b8(%rax)
>> =C2=A0=C2=A0=C2=A0 d:=C2=A0=C2=A0=C2=A0 00 00 00
>> =C2=A0=C2=A0 10:=C2=A0=C2=A0=C2=A0 41 89 4d cc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=
=A0 %ecx,-0x34(%r13)
>> =C2=A0=C2=A0 14:=C2=A0=C2=A0=C2=A0 89 f9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %edi,%ecx
>> [=C2=A0=C2=A0 36.054162][=C2=A0=C2=A0=C2=A0 C0] EAX: 000003c8 EBX: 00000=
0c0 ECX: c01d3f8c EDX: 007ffdf2
>> [=C2=A0=C2=A0 36.055033][=C2=A0=C2=A0=C2=A0 C0] ESI: f7a5c284 EDI: c01d3=
f90 EBP: c01d3fbc ESP: c01d3f78
>> [=C2=A0=C2=A0 36.056023][=C2=A0=C2=A0=C2=A0 C0] DS: 007b ES: 007b FS: 00=
00 GS: 0033 SS: 0068 EFLAGS: 00010086
>> [=C2=A0=C2=A0 36.056827][=C2=A0=C2=A0=C2=A0 C0] CR0: 80050033 CR2: f7a5c=
288 CR3: 347fd000 CR4: 00000690
>> [=C2=A0=C2=A0 36.057861][=C2=A0=C2=A0=C2=A0 C0] Call Trace:
>> [=C2=A0=C2=A0 36.058411][=C2=A0=C2=A0=C2=A0 C0]=C2=A0 <SOFTIRQ>
>> [ 36.058940][ C0] ? queue_work_node (kernel/workqueue.c:1640)
>> [ 36.059474][ C0] ? do_softirq_own_stack (arch/x86/kernel/irq_32.c:60 ar=
ch/x86/kernel/irq_32.c:149)
>> [ 36.060008][ C0] __do_softirq (arch/x86/include/asm/jump_label.h:41 inc=
lude/linux/jump_label.h:212 include/trace/events/irq.h:142 kernel/softirq.c=
:559)
>> [ 36.060499][ C0] ? __softirqentry_text_start (kernel/softirq.c:516)
>> [ 36.061078][ C0] do_softirq_own_stack (arch/x86/kernel/irq_32.c:60 arch=
/x86/kernel/irq_32.c:149)
>> [=C2=A0=C2=A0 36.061626][=C2=A0=C2=A0=C2=A0 C0]=C2=A0 </SOFTIRQ>
>> [ 36.061992][ C0] irq_exit (kernel/softirq.c:439 kernel/softirq.c:636 ke=
rnel/softirq.c:626 kernel/softirq.c:660)
>> [ 36.062434][ C0] common_interrupt (arch/x86/kernel/irq.c:240)
>> [ 36.062915][ C0] asm_common_interrupt (arch/x86/include/asm/idtentry.h:=
629)
>> [=C2=A0=C2=A0 36.063497][=C2=A0=C2=A0=C2=A0 C0] EIP: 0x442062
>> [ 36.063986][ C0] Code: a8 04 74 03 8b 57 04 83 e0 03 89 4c 24 04 83 ec =
08 c1 e0 04 ff 74 24 10 8b 8c 05 a4 f8 ff ff 8b 07 0f af cb ff 34 0a ff 50 =
04 <83> c4 10 85 c0 8b 4c 24 04 75 9d 83 c4 1c 89 d8 5b 5e 5f 5d c3 89
>> All code
>> =3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0 a8 04=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 test=C2=A0=C2=A0 $0x4,%al
>> =C2=A0=C2=A0=C2=A0 2:=C2=A0=C2=A0=C2=A0 74 03=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 je=C2=A0=C2=A0=C2=A0=C2=A0 0x7
>> =C2=A0=C2=A0=C2=A0 4:=C2=A0=C2=A0=C2=A0 8b 57 04=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mo=
v=C2=A0=C2=A0=C2=A0 0x4(%rdi),%edx
>> =C2=A0=C2=A0=C2=A0 7:=C2=A0=C2=A0=C2=A0 83 e0 03=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 an=
d=C2=A0=C2=A0=C2=A0 $0x3,%eax
>> =C2=A0=C2=A0=C2=A0 a:=C2=A0=C2=A0=C2=A0 89 4c 24 04=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 %ecx,0x4(%rsp)
>> =C2=A0=C2=A0=C2=A0 e:=C2=A0=C2=A0=C2=A0 83 ec 08=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 su=
b=C2=A0=C2=A0=C2=A0 $0x8,%esp
>> =C2=A0=C2=A0 11:=C2=A0=C2=A0=C2=A0 c1 e0 04=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shl=
=C2=A0=C2=A0=C2=A0 $0x4,%eax
>> =C2=A0=C2=A0 14:=C2=A0=C2=A0=C2=A0 ff 74 24 10=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pushq=C2=A0 0x10(%rs=
p)
>> =C2=A0=C2=A0 18:=C2=A0=C2=A0=C2=A0 8b 8c 05 a4 f8 ff ff=C2=A0=C2=A0=C2=
=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 -0x75c(%rbp,%rax,1),%ecx
>> =C2=A0=C2=A0 1f:=C2=A0=C2=A0=C2=A0 8b 07=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 (%rdi),%eax
>> =C2=A0=C2=A0 21:=C2=A0=C2=A0=C2=A0 0f af cb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 imul=
=C2=A0=C2=A0 %ebx,%ecx
>> =C2=A0=C2=A0 24:=C2=A0=C2=A0=C2=A0 ff 34 0a=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pushq=
=C2=A0 (%rdx,%rcx,1)
>> =C2=A0=C2=A0 27:=C2=A0=C2=A0=C2=A0 ff 50 04=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 callq=
=C2=A0 *0x4(%rax)
>> =C2=A0=C2=A0 2a:*=C2=A0=C2=A0=C2=A0 83 c4 10=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=
=C2=A0=C2=A0=C2=A0 $0x10,%esp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <--=
 trapping instruction
>> =C2=A0=C2=A0 2d:=C2=A0=C2=A0=C2=A0 85 c0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 test=C2=A0=C2=A0 %eax,%eax
>> =C2=A0=C2=A0 2f:=C2=A0=C2=A0=C2=A0 8b 4c 24 04=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=
=A0 0x4(%rsp),%ecx
>> =C2=A0=C2=A0 33:=C2=A0=C2=A0=C2=A0 75 9d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 jne=C2=A0=C2=A0=C2=A0 0xffffffffffffffd2
>> =C2=A0=C2=A0 35:=C2=A0=C2=A0=C2=A0 83 c4 1c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=
=C2=A0=C2=A0=C2=A0 $0x1c,%esp
>> =C2=A0=C2=A0 38:=C2=A0=C2=A0=C2=A0 89 d8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %ebx,%eax
>> =C2=A0=C2=A0 3a:=C2=A0=C2=A0=C2=A0 5b=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rbx
>> =C2=A0=C2=A0 3b:=C2=A0=C2=A0=C2=A0 5e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rsi
>> =C2=A0=C2=A0 3c:=C2=A0=C2=A0=C2=A0 5f=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rdi
>> =C2=A0=C2=A0 3d:=C2=A0=C2=A0=C2=A0 5d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rbp
>> =C2=A0=C2=A0 3e:=C2=A0=C2=A0=C2=A0 c3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 retq
>> =C2=A0=C2=A0 3f:=C2=A0=C2=A0=C2=A0 89=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 .byte 0x89
>>
>> Code starting with the faulting instruction
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0 83 c4 10=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ad=
d=C2=A0=C2=A0=C2=A0 $0x10,%esp
>> =C2=A0=C2=A0=C2=A0 3:=C2=A0=C2=A0=C2=A0 85 c0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 test=C2=A0=C2=A0 %eax,%eax
>> =C2=A0=C2=A0=C2=A0 5:=C2=A0=C2=A0=C2=A0 8b 4c 24 04=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 0x4(%rsp),%ecx
>> =C2=A0=C2=A0=C2=A0 9:=C2=A0=C2=A0=C2=A0 75 9d=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 jne=C2=A0=C2=A0=C2=A0 0xffffffffffffffa8
>> =C2=A0=C2=A0=C2=A0 b:=C2=A0=C2=A0=C2=A0 83 c4 1c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ad=
d=C2=A0=C2=A0=C2=A0 $0x1c,%esp
>> =C2=A0=C2=A0=C2=A0 e:=C2=A0=C2=A0=C2=A0 89 d8=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %ebx,%eax
>> =C2=A0=C2=A0 10:=C2=A0=C2=A0=C2=A0 5b=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rbx
>> =C2=A0=C2=A0 11:=C2=A0=C2=A0=C2=A0 5e=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rsi
>> =C2=A0=C2=A0 12:=C2=A0=C2=A0=C2=A0 5f=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rdi
>> =C2=A0=C2=A0 13:=C2=A0=C2=A0=C2=A0 5d=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 %rbp
>> =C2=A0=C2=A0 14:=C2=A0=C2=A0=C2=A0 c3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 retq
>> =C2=A0=C2=A0 15:=C2=A0=C2=A0=C2=A0 89=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 .byte 0x89
>> [=C2=A0=C2=A0 36.066801][=C2=A0=C2=A0=C2=A0 C0] EAX: 00000000 EBX: 00000=
008 ECX: 00000000 EDX: 00fc8f18
>> [=C2=A0=C2=A0 36.067588][=C2=A0=C2=A0=C2=A0 C0] ESI: 00000000 EDI: 00fe7=
554 EBP: 00484be0 ESP: bf86a370
>> [=C2=A0=C2=A0 36.068349][=C2=A0=C2=A0=C2=A0 C0] DS: 007b ES: 007b FS: 00=
00 GS: 0033 SS: 007b EFLAGS: 00000282
>> [=C2=A0=C2=A0 36.069124][=C2=A0=C2=A0=C2=A0 C0] Modules linked in: bochs=
 drm_vram_helper drm_ttm_helper ttm drm_kms_helper crc32c_intel rapl drm i2=
c_piix4 drm_panel_orientation_quirks
>> [=C2=A0=C2=A0 36.070793][=C2=A0=C2=A0=C2=A0 C0] CR2: 00000000f7a5c288
>> [=C2=A0=C2=A0 36.071230][=C2=A0=C2=A0=C2=A0 C0] ---[ end trace ffe479231=
1281b74 ]---
>> [ 36.071825][ C0] EIP: run_timer_softirq (include/linux/list.h:968 kerne=
l/time/timer.c:1487 kernel/time/timer.c:1723 kernel/time/timer.c:1747)
>> [ 36.072411][ C0] Code: 00 00 8d 4d d0 8d 76 00 89 d0 83 e0 3f 01 d8 0f =
b3 05 00 08 ca c2 73 28 c1 e0 02 8d 79 04 8b b0 48 08 ca c2 89 31 85 f6 74 =
03 <89> 4e 04 8b 4d cc c7 80 48 08 ca c2 00 00 00 00 41 89 4d cc 89 f9
>> All code
>> =3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0 00 00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0 %al,(%rax)
>> =C2=A0=C2=A0=C2=A0 2:=C2=A0=C2=A0=C2=A0 8d 4d d0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 le=
a=C2=A0=C2=A0=C2=A0 -0x30(%rbp),%ecx
>> =C2=A0=C2=A0=C2=A0 5:=C2=A0=C2=A0=C2=A0 8d 76 00=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 le=
a=C2=A0=C2=A0=C2=A0 0x0(%rsi),%esi
>> =C2=A0=C2=A0=C2=A0 8:=C2=A0=C2=A0=C2=A0 89 d0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %edx,%eax
>> =C2=A0=C2=A0=C2=A0 a:=C2=A0=C2=A0=C2=A0 83 e0 3f=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 an=
d=C2=A0=C2=A0=C2=A0 $0x3f,%eax
>> =C2=A0=C2=A0=C2=A0 d:=C2=A0=C2=A0=C2=A0 01 d8=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0 %ebx,%eax
>> =C2=A0=C2=A0=C2=A0 f:=C2=A0=C2=A0=C2=A0 0f b3 05 00 08 ca c2=C2=A0=C2=A0=
=C2=A0=C2=A0 btr=C2=A0=C2=A0=C2=A0 %eax,-0x3d35f800(%rip)=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # 0xffffffffc2ca0816
>> =C2=A0=C2=A0 16:=C2=A0=C2=A0=C2=A0 73 28=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 jae=C2=A0=C2=A0=C2=A0 0x40
>> =C2=A0=C2=A0 18:=C2=A0=C2=A0=C2=A0 c1 e0 02=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 shl=
=C2=A0=C2=A0=C2=A0 $0x2,%eax
>> =C2=A0=C2=A0 1b:=C2=A0=C2=A0=C2=A0 8d 79 04=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lea=
=C2=A0=C2=A0=C2=A0 0x4(%rcx),%edi
>> =C2=A0=C2=A0 1e:=C2=A0=C2=A0=C2=A0 8b b0 48 08 ca c2=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 -0x3d35f7b8(%rax),%esi
>> =C2=A0=C2=A0 24:=C2=A0=C2=A0=C2=A0 89 31=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %esi,(%rcx)
>> =C2=A0=C2=A0 26:=C2=A0=C2=A0=C2=A0 85 f6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 test=C2=A0=C2=A0 %esi,%esi
>> =C2=A0=C2=A0 28:=C2=A0=C2=A0=C2=A0 74 03=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 je=C2=A0=C2=A0=C2=A0=C2=A0 0x2d
>> =C2=A0=C2=A0 2a:*=C2=A0=C2=A0=C2=A0 89 4e 04=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=
=C2=A0=C2=A0=C2=A0 %ecx,0x4(%rsi)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 <-- trapping instruction
>> =C2=A0=C2=A0 2d:=C2=A0=C2=A0=C2=A0 8b 4d cc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=
=C2=A0=C2=A0=C2=A0 -0x34(%rbp),%ecx
>> =C2=A0=C2=A0 30:=C2=A0=C2=A0=C2=A0 c7 80 48 08 ca c2 00=C2=A0=C2=A0=C2=
=A0=C2=A0 movl=C2=A0=C2=A0 $0x0,-0x3d35f7b8(%rax)
>> =C2=A0=C2=A0 37:=C2=A0=C2=A0=C2=A0 00 00 00
>> =C2=A0=C2=A0 3a:=C2=A0=C2=A0=C2=A0 41 89 4d cc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=
=A0 %ecx,-0x34(%r13)
>> =C2=A0=C2=A0 3e:=C2=A0=C2=A0=C2=A0 89 f9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %edi,%ecx
>>
>> Code starting with the faulting instruction
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> =C2=A0=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0 89 4e 04=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mo=
v=C2=A0=C2=A0=C2=A0 %ecx,0x4(%rsi)
>> =C2=A0=C2=A0=C2=A0 3:=C2=A0=C2=A0=C2=A0 8b 4d cc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mo=
v=C2=A0=C2=A0=C2=A0 -0x34(%rbp),%ecx
>> =C2=A0=C2=A0=C2=A0 6:=C2=A0=C2=A0=C2=A0 c7 80 48 08 ca c2 00=C2=A0=C2=A0=
=C2=A0=C2=A0 movl=C2=A0=C2=A0 $0x0,-0x3d35f7b8(%rax)
>> =C2=A0=C2=A0=C2=A0 d:=C2=A0=C2=A0=C2=A0 00 00 00
>> =C2=A0=C2=A0 10:=C2=A0=C2=A0=C2=A0 41 89 4d cc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=
=A0 %ecx,-0x34(%r13)
>> =C2=A0=C2=A0 14:=C2=A0=C2=A0=C2=A0 89 f9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 %edi,%ecx
>>
>>
>> To reproduce:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # build kernel
>> =C2=A0=C2=A0=C2=A0=C2=A0cd linux
>> =C2=A0=C2=A0=C2=A0=C2=A0cp config-5.15.0-rc4-01167-g7482e3841d52 .config
>> =C2=A0=C2=A0=C2=A0=C2=A0make HOSTCC=3Dgcc-9 CC=3Dgcc-9 ARCH=3Di386 oldde=
fconfig prepare modules_prepare bzImage
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://githu=
b.com/intel/lkp-tests.git
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp qemu -k <bzImag=
e> job-script # job-script is attached in this email
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # if come across any fa=
ilure that blocks the test,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # please remove ~/.lkp =
and /lkp dir to run from a clean state.

I ran the test multiple times, but it seems I cannot reproduce. Would be go=
od if you could
double check below whether it looks / passes as expected or if I'm doing so=
mething wrong:

root(a)fr-c3-small-x86-01:~/net/lkp-tests# bin/lkp qemu -k ../arch/x86/boot=
/bzImage ./job-script
result_root: /root/.lkp//result/boot/1/vm-snb-i386/debian-i386-20191205.cgz=
/i386-randconfig-a015-20211103/gcc-9/7482e3841d520a368426ac196720601687e2dc=
47/3
downloading initrds ...
/usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 http=
s://download.01.org/0day-ci/lkp-qemu/osimage/debian/debian-i386-20191205.cg=
z -N -P /root/.lkp/cache/osimage/debian
550160 blocks
/usr/bin/wget -q --timeout=3D1800 --tries=3D1 --local-encoding=3DUTF-8 http=
s://download.01.org/0day-ci/lkp-qemu/osimage/deps/debian-i386-20191205.cgz/=
lkp_20201203.cgz -N -P /root/.lkp/cache/osimage/deps/debian-i386-20191205.c=
gz
4829 blocks
exec command: qemu-system-x86_64 -enable-kvm -fsdev local,id=3Dtest_dev,pat=
h=3D/root/.lkp//result/boot/1/vm-snb-i386/debian-i386-20191205.cgz/i386-ran=
dconfig-a015-20211103/gcc-9/7482e3841d520a368426ac196720601687e2dc47/3,secu=
rity_model=3Dnone -device virtio-9p-pci,fsdev=3Dtest_dev,mount_tag=3D9p/vir=
tfs_mount -kernel ../arch/x86/boot/bzImage -append root=3D/dev/ram0 user=3D=
lkp job=3D/lkp/jobs/scheduled/vm-snb-i386-39/boot-1-debian-i386-20191205.cg=
z-7482e3841d520a368426ac196720601687e2dc47-20211104-18628-2k9id3-1.yaml ARC=
H=3Di386 kconfig=3Di386-randconfig-a015-20211103 branch=3Dtnguy-next-queue/=
dev-queue commit=3D7482e3841d520a368426ac196720601687e2dc47 BOOT_IMAGE=3D/p=
kg/linux/i386-randconfig-a015-20211103/gcc-9/7482e3841d520a368426ac19672060=
1687e2dc47/vmlinuz-5.15.0-rc4-01167-g7482e3841d52 vmalloc=3D128M initramfs_=
async=3D0 page_owner=3Don max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-=
snb-i386/debian-i386-20191205.cgz/i386-randconfig-a015-20211103/gcc-9/7482e=
3841d520a368426ac196720601687e2dc47/3 LKP_LOCAL_RUN=3D1 selinux=3D0 debug a=
pic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.i=
fnames=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=
=3Dpanic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=
=3D8 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3Dt=
tyS0,115200 console=3DttyS0,115200 vga=3Dnormal rw  ip=3Ddhcp result_servic=
e=3D9p/virtfs_mount -initrd /root/.lkp/cache/final_initrd -smp 2 -m 4096M -=
no-reboot -watchdog i6300esb -rtc base=3Dlocaltime -device e1000,netdev=3Dn=
et0 -netdev user,id=3Dnet0 -display none -monitor null -serial stdio
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
80000001H:ECX.svm [bit 2]
qemu-system-x86_64: warning: host doesn't support requested feature: CPUID.=
80000001H:ECX.svm [bit 2]
early console in setup code
early console in extract_kernel
input_data: 0x029b2079
input_len: 0x01001715
output: 0x01000000
output_len: 0x02064ac8
kernel_total_size: 0x029ca000
needed_size: 0x029ca000

Decompressing Linux... Parsing ELF... done.
Booting the kernel.
[    0.000000][    T0] Linux version 5.15.0-04621-g436014e860d3 (root(a)fr-=
c3-small-x86-01) (gcc (Ubuntu 10.3.0-1ubuntu1~20.10) 10.3.0, GNU ld (GNU Bi=
nutils for Ubuntu) 2.35.1) #1 PREEMPT Fri Nov 5 10:05:35 UTC 2021
[    0.000000][    T0] KERNEL supported cpus:
[    0.000000][    T0]   Intel GenuineIntel
[    0.000000][    T0]   Transmeta GenuineTMx86
[    0.000000][    T0]   Transmeta TransmetaCPU
[    0.000000][    T0]   UMC UMC UMC UMC
[    0.000000][    T0]   Vortex Vortex86 SoC
[    0.000000][    T0] x86/fpu: x87 FPU will use FXSAVE
[    0.000000][    T0] signal: max sigframe size: 1440
[    0.000000][    T0] BIOS-provided physical RAM map:
[    0.000000][    T0] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbf=
f] usable
[    0.000000][    T0] BIOS-e820: [mem 0x000000000009fc00-0x000000000009fff=
f] reserved
[    0.000000][    T0] BIOS-e820: [mem 0x00000000000f0000-0x00000000000ffff=
f] reserved
[    0.000000][    T0] BIOS-e820: [mem 0x0000000000100000-0x00000000bffdfff=
f] usable
[    0.000000][    T0] BIOS-e820: [mem 0x00000000bffe0000-0x00000000bffffff=
f] reserved
[    0.000000][    T0] BIOS-e820: [mem 0x00000000feffc000-0x00000000fefffff=
f] reserved
[    0.000000][    T0] BIOS-e820: [mem 0x00000000fffc0000-0x00000000fffffff=
f] reserved
[    0.000000][    T0] BIOS-e820: [mem 0x0000000100000000-0x000000013ffffff=
f] usable
[    0.000000][    T0] printk: debug: ignoring loglevel setting.
[    0.000000][    T0] printk: bootconsole [earlyser0] enabled
[    0.000000][    T0] Notice: NX (Execute Disable) protection cannot be en=
abled: non-PAE kernel!
[    0.000000][    T0] SMBIOS 2.8 present.
[    0.000000][    T0] DMI: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.=
14.0-1 04/01/2014
[    0.000000][    T0] Hypervisor detected: KVM
[    0.000000][    T0] kvm-clock: Using msrs 4b564d01 and 4b564d00
[    0.000000][    T0] kvm-clock: cpu 0, msr 3077001, primary cpu clock
[    0.000008][    T0] kvm-clock: using sched offset of 97880273 cycles
[    0.000408][    T0] clocksource: kvm-clock: mask: 0xffffffffffffffff max=
_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.001510][    T0] tsc: Detected 3408.102 MHz processor
[    0.002730][    T0] e820: update [mem 0x00000000-0x00000fff] usable =3D=
=3D> reserved
[    0.003200][    T0] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.003636][    T0] last_pfn =3D 0xbffe0 max_arch_pfn =3D 0x100000
[    0.004036][    T0] x86/PAT: PAT not supported by the CPU.
[    0.004396][    T0] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WB  WT=
  UC- UC
[    0.004872][    T0] initial memory mapped: [mem 0x00000000-0x03bfffff]
[    0.005374][    T0] RAMDISK: [mem 0x7921c000-0x7fffffff]
[    0.005740][    T0] Allocated new RAMDISK: [mem 0x2fe1a000-0x36bfd545]
[    0.032240][    T0] Move RAMDISK from [mem 0x7921c000-0x7ffff545] to [me=
m 0x2fe1a000-0x36bfd545]
[    0.032833][    T0] ACPI: Early table checksum verification disabled
[    0.033279][    T0] ACPI: RSDP 0x00000000000F5A90 000014 (v00 BOCHS )
[    0.033692][    T0] ACPI: RSDT 0x00000000BFFE15C9 000030 (v01 BOCHS  BXP=
CRSDT 00000001 BXPC 00000001)
[    0.034274][    T0] ACPI: FACP 0x00000000BFFE149D 000074 (v01 BOCHS  BXP=
CFACP 00000001 BXPC 00000001)
[    0.034857][    T0] ACPI: DSDT 0x00000000BFFE0040 00145D (v01 BOCHS  BXP=
CDSDT 00000001 BXPC 00000001)
[    0.035441][    T0] ACPI: FACS 0x00000000BFFE0000 000040
[    0.035780][    T0] ACPI: APIC 0x00000000BFFE1511 000080 (v01 BOCHS  BXP=
CAPIC 00000001 BXPC 00000001)
[    0.036389][    T0] ACPI: HPET 0x00000000BFFE1591 000038 (v01 BOCHS  BXP=
CHPET 00000001 BXPC 00000001)
[    0.036968][    T0] ACPI: Reserving FACP table memory at [mem 0xbffe149d=
-0xbffe1510]
[    0.037514][    T0] ACPI: Reserving DSDT table memory at [mem 0xbffe0040=
-0xbffe149c]
[    0.037996][    T0] ACPI: Reserving FACS table memory at [mem 0xbffe0000=
-0xbffe003f]
[    0.038482][    T0] ACPI: Reserving APIC table memory at [mem 0xbffe1511=
-0xbffe1590]
[    0.038967][    T0] ACPI: Reserving HPET table memory at [mem 0xbffe1591=
-0xbffe15c8]
[    0.039493][    T0] 2195MB HIGHMEM available.
[    0.039769][    T0] 875MB LOWMEM available.
[    0.040033][    T0]   mapped low ram: 0 - 36bfe000
[    0.040334][    T0]   low ram: 0 - 36bfe000
[    0.040628][    T0] Zone ranges:
[    0.040831][    T0]   Normal   [mem 0x0000000000001000-0x0000000036bfdff=
f]
[    0.041292][    T0]   HighMem  [mem 0x0000000036bfe000-0x00000000bffdfff=
f]
[    0.041753][    T0] Movable zone start for each node
[    0.042062][    T0] Early memory node ranges
[    0.042329][    T0]   node   0: [mem 0x0000000000001000-0x000000000009ef=
ff]
[    0.042797][    T0]   node   0: [mem 0x0000000000100000-0x00000000bffdff=
ff]
[    0.043235][    T0] Initmem setup node 0 [mem 0x0000000000001000-0x00000=
000bffdffff]
[    0.045850][    T0] On node 0, zone Normal: 1 pages in unavailable ranges
[    0.047862][    T0] On node 0, zone Normal: 97 pages in unavailable rang=
es
[    0.053524][    T0] ACPI: PM-Timer IO Port: 0x608
[    0.054257][    T0] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.054672][    T0] kvm-guest: stealtime: cpu 0, msr 28e26c0
[    0.055152][    T0] [mem 0xc0000000-0xfeffbfff] available for PCI devices
[    0.055622][    T0] Booting paravirtualized kernel on KVM
[    0.056003][    T0] clocksource: refined-jiffies: mask: 0xffffffff max_c=
ycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.056753][    T0] pcpu-alloc: s0 r0 d32768 u32768 alloc=3D1*32768
[    0.057144][    T0] pcpu-alloc: [0] 0
[    0.057399][    T0] Built 1 zonelists, mobility grouping on.  Total page=
s: 784550
[    0.057879][    T0] Kernel command line: root=3D/dev/ram0 user=3Dlkp job=
=3D/lkp/jobs/scheduled/vm-snb-i386-39/boot-1-debian-i386-20191205.cgz-7482e=
3841d520a368426ac196720601687e2dc47-20211104-18628-2k9id3-1.yaml ARCH=3Di38=
6 kconfig=3Di386-randconfig-a015-20211103 branch=3Dtnguy-next-queue/dev-que=
ue commit=3D7482e3841d520a368426ac196720601687e2dc47 BOOT_IMAGE=3D/pkg/linu=
x/i386-randconfig-a015-20211103/gcc-9/7482e3841d520a368426ac196720601687e2d=
c47/vmlinuz-5.15.0-rc4-01167-g7482e3841d52 vmalloc=3D128M initramfs_async=
=3D0 page_owner=3Don max_uptime=3D600 RESULT_ROOT=3D/result/boot/1/vm-snb-i=
386/debian-i386-20191205.cgz/i386-randconfig-a015-20211103/gcc-9/7482e3841d=
520a368426ac196720601687e2dc47/3 LKP_LOCAL_RUN=3D1 selinux=3D0 debug apic=
=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=3D100 net.ifna=
mes=3D0 printk.devkmsg=3Don panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3D=
panic oops=3Dpanic load_ramdisk=3D2 prompt_ramdisk=3D0 drbd.minor_count=3D8=
 systemd.log_level=3Derr ignore_loglevel console=3Dtty0 earlyprintk=3DttyS0=
,115200
[    0.058140][    T0] sysrq: sysrq always enabled.
[    0.064166][    T0] ignoring the deprecated load_ramdisk=3D option
[    0.064732][    T0] Unknown command line parameters: user=3Dlkp job=3D/l=
kp/jobs/scheduled/vm-snb-i386-39/boot-1-debian-i386-20191205.cgz-7482e3841d=
520a368426ac196720601687e2dc47-20211104-18628-2k9id3-1.yaml ARCH=3Di386 kco=
nfig=3Di386-randconfig-a015-20211103 branch=3Dtnguy-next-queue/dev-queue co=
mmit=3D7482e3841d520a368426ac196720601687e2dc47 BOOT_IMAGE=3D/pkg/linux/i38=
6-randconfig-a015-20211103/gcc-9/7482e3841d520a368426ac196720601687e2dc47/v=
mlinuz-5.15.0-rc4-01167-g7482e3841d52 max_uptime=3D600 RESULT_ROOT=3D/resul=
t/boot/1/vm-snb-i386/debian-i386-20191205.cgz/i386-randconfig-a015-20211103=
/gcc-9/7482e3841d520a368426ac196720601687e2dc47/3 LKP_LOCAL_RUN=3D1 selinux=
=3D0 apic=3Ddebug softlockup_panic=3D1 nmi_watchdog=3Dpanic prompt_ramdisk=
=3D0 vga=3Dnormal result_service=3D9p/virtfs_mount
[    0.069340][    T0] Dentry cache hash table entries: 131072 (order: 7, 5=
24288 bytes, linear)
[    0.069883][    T0] Inode-cache hash table entries: 65536 (order: 6, 262=
144 bytes, linear)
[    0.073059][    T0] allocated 31496920 bytes of page_ext
[    0.073449][    T0] mem auto-init: stack:off, heap alloc:off, heap free:=
on
[    0.073888][    T0] mem auto-init: clearing system memory may take some =
time...
[    0.075130][    T0] Initializing HighMem for node 0 (00036bfe:000bffe0)
[    0.774452][    T0] Initializing Movable for node 0 (00000000:00000000)
[    0.879267][    T0] Checking if this processor honours the WP bit even i=
n supervisor mode...Ok.
[    0.879891][    T0] Memory: 2930104K/3145208K available (14624K kernel c=
ode, 6714K rwdata, 10696K rodata, 996K init, 8448K bss, 215104K reserved, 0=
K cma-reserved, 2248584K highmem)
[    0.881621][    T0] Node 0, zone   Normal: page owner found early alloca=
ted 8 pages
[    0.882175][    T0] Node 0, zone  HighMem: page owner found early alloca=
ted 0 pages
[    0.882994][    T0] ODEBUG: selftest passed
[    0.883275][    T0] ftrace: allocating 47154 entries in 93 pages
[    0.897399][    T0] ftrace: allocated 93 pages with 5 groups
[    0.897827][    T0] trace event string verifier disabled
[    0.898214][    T0] Dynamic Preempt: none
[    0.898531][    T0] Running RCU self tests
[    0.898800][    T0] rcu: Preemptible hierarchical RCU implementation.
[    0.899207][    T0] rcu: 	RCU event tracing is enabled.
[    0.899542][    T0] rcu: 	RCU lockdep checking is enabled.
[    0.899890][    T0] rcu: 	RCU debug extended QS entry/exit.
[    0.900294][    T0] 	RCU CPU stall warnings timeout set to 100 (rcu_cpu_=
stall_timeout).
[    0.900799][    T0] 	Trampoline variant of Tasks RCU enabled.
[    0.901165][    T0] 	Rude variant of Tasks RCU enabled.
[    0.901494][    T0] 	Tracing variant of Tasks RCU enabled.
[    0.901842][    T0] rcu: RCU calculated value of scheduler-enlistment de=
lay is 100 jiffies.
[    0.904040][    T0] NR_IRQS: 16, nr_irqs: 16, preallocated irqs: 16
[    0.904743][    T0] printk: console [ttyS0] enabled
[    0.904743][    T0] printk: console [ttyS0] enabled
[    0.905375][    T0] printk: bootconsole [earlyser0] disabled
[    0.905375][    T0] printk: bootconsole [earlyser0] disabled
[    0.906156][    T0] Lock dependency validator: Copyright (c) 2006 Red Ha=
t, Inc., Ingo Molnar
[    0.906697][    T0] ... MAX_LOCKDEP_SUBCLASSES:  8
[    0.907008][    T0] ... MAX_LOCK_DEPTH:          48
[    0.907325][    T0] ... MAX_LOCKDEP_KEYS:        8192
[    0.907657][    T0] ... CLASSHASH_SIZE:          4096
[    0.907984][    T0] ... MAX_LOCKDEP_ENTRIES:     32768
[    0.908318][    T0] ... MAX_LOCKDEP_CHAINS:      65536
[    0.908683][    T0] ... CHAINHASH_SIZE:          32768
[    0.909014][    T0]  memory used by lock dependency info: 4061 kB
[    0.909439][    T0]  memory used for stack traces: 2112 kB
[    0.909826][    T0]  per task-struct memory footprint: 2112 bytes
[    0.910229][    T0] ACPI: Core revision 20210730
[    0.910611][    T0] ACPI: setting ELCR to 0200 (from 0c00)
[    0.911027][    T0] clocksource: hpet: mask: 0xffffffff max_cycles: 0xff=
ffffff, max_idle_ns: 19112604467 ns
[    0.911774][    T0] clocksource: tsc-early: mask: 0xffffffffffffffff max=
_cycles: 0x3120346d527, max_idle_ns: 440795374341 ns
[    0.912509][    T0] Calibrating delay loop (skipped) preset value.. 6816=
.20 BogoMIPS (lpj=3D3408102)
[    0.913508][    T0] pid_max: default: 32768 minimum: 301
[    0.913868][    T0] LSM: Security Framework initializing
[    0.914522][    T0] Mount-cache hash table entries: 2048 (order: 1, 8192=
 bytes, linear)
[    0.915072][    T0] Mountpoint-cache hash table entries: 2048 (order: 1,=
 8192 bytes, linear)
[    0.915917][    T0] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.916509][    T0] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.916948][    T0] CPU: Intel QEMU Virtual CPU version 2.5+ (family: 0x=
6, model: 0x6, stepping: 0x3)
[    0.917508][    T0] Spectre V1 : Mitigation: usercopy/swapgs barriers an=
d __user pointer sanitization
[    0.918167][    T0] Spectre V2 : Spectre mitigation: kernel not compiled=
 with retpoline; no mitigation available!
[    0.918169][    T0] Speculative Store Bypass: Vulnerable
[    0.918900][    T0] L1TF: Kernel not compiled for PAE. No mitigation for=
 L1TF
[    0.919513][    T0] MDS: Vulnerable: Clear CPU buffers attempted, no mic=
rocode
[    0.921340][    T1] Running RCU-tasks wait API self tests
[    1.024100][    T1] Performance Events: PMU not available due to virtual=
ization, using software events only.
[    1.025989][    T1] rcu: Hierarchical SRCU implementation.
[    1.030292][    T1] devtmpfs: initialized
[    1.032789][    T1] version magic: 0x4230332a
[    1.036078][    T1] random: get_random_u32 called from bucket_table_allo=
c.isra.0+0xae/0x1c0 with crng_init=3D0
[    1.036393][   T11] Callback from call_rcu_tasks_trace() invoked.
[    1.040673][    T1] clocksource: jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1911260446275000 ns
[    1.041535][    T1] futex hash table entries: 256 (order: 1, 14336 bytes=
, linear)
[    1.043819][    T1] prandom: seed boundary self test passed
[    1.045758][    T1] prandom: 100 self tests passed
[    1.051202][    T1] prandom32: self test passed (less than 6 bits correl=
ated)
[    1.052543][    T1] regulator-dummy: no parameters, enabled
[    1.053614][    T1] PM: RTC time: 10:24:32, date: 2021-11-05
[    1.054804][    T1] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    1.057736][    T1] thermal_sys: Registered thermal governor 'fair_share'
[    1.057741][    T1] thermal_sys: Registered thermal governor 'user_space'
[    1.058550][    T1] EISA bus registered
[    1.059565][    T1] cpuidle: using governor menu
[    1.060852][    T1] ACPI: bus type PCI registered
[    1.061482][    T1] PCI: Using configuration type 1 for base access
[    1.074716][    T1] kprobes: kprobe jump-optimization is enabled. All kp=
robes are optimized if possible.
[    1.075783][    T1] HugeTLB registered 4.00 MiB page size, pre-allocated=
 0 pages
[    1.076815][    T1] cryptd: max_cpu_qlen set to 1000
[    1.077405][    T1] ACPI: Added _OSI(Module Device)
[    1.077511][    T1] ACPI: Added _OSI(Processor Device)
[    1.077873][    T1] ACPI: Added _OSI(3.0 _SCP Extensions)
[    1.078512][    T1] ACPI: Added _OSI(Processor Aggregator Device)
[    1.078938][    T1] ACPI: Added _OSI(Linux-Dell-Video)
[    1.079303][    T1] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    1.079512][    T1] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    1.085395][    T1] ACPI: 1 ACPI AML tables successfully acquired and lo=
aded
[    1.088646][    T1] ACPI: Interpreter enabled
[    1.088981][    T1] ACPI: PM: (supports S0 S3 S5)
[    1.089299][    T1] ACPI: Using PIC for interrupt routing
[    1.089553][    T1] PCI: Using host bridge windows from ACPI; if necessa=
ry, use "pci=3Dnocrs" and report a bug
[    1.090944][    T1] ACPI: Enabled 2 GPEs in block 00 to 0F
[    1.107686][    T1] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff=
])
[    1.108131][    T1] acpi PNP0A03:00: _OSC: OS supports [Segments HPX-Typ=
e3]
[    1.108538][    T1] acpi PNP0A03:00: fail to add MMCONFIG information, c=
an't access extended PCI configuration space under this bridge.
[    1.109519][    T1] acpi resource window ([0x140000000-0x1bfffffff] igno=
red, not CPU addressable)
[    1.110295][    T1] PCI host bridge to bus 0000:00
[    1.110511][    T1] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf=
7 window]
[    1.111005][    T1] pci_bus 0000:00: root bus resource [io  0x0d00-0xfff=
f window]
[    1.111510][    T1] pci_bus 0000:00: root bus resource [mem 0x000a0000-0=
x000bffff window]
[    1.112048][    T1] pci_bus 0000:00: root bus resource [mem 0xc0000000-0=
xfebfffff window]
[    1.112511][    T1] pci_bus 0000:00: root bus resource [bus 00-ff]
[    1.113924][    T1] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
[    1.115671][    T1] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
[    1.116962][    T1] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
[    1.118504][    T1] pci 0000:00:01.1: reg 0x20: [io  0xc080-0xc08f]
[    1.119010][    T1] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0=
x01f0-0x01f7]
[    1.119510][    T1] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0=
x03f6]
[    1.120509][    T1] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0=
x0170-0x0177]
[    1.121021][    T1] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0=
x0376]
[    1.122776][    T1] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
[    1.123459][    T1] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed=
 by PIIX4 ACPI
[    1.123515][    T1] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed=
 by PIIX4 SMB
[    1.125607][    T1] pci 0000:00:02.0: [1234:1111] type 00 class 0x030000
[    1.126783][    T1] pci 0000:00:02.0: reg 0x10: [mem 0xfd000000-0xfdffff=
ff pref]
[    1.128693][    T1] pci 0000:00:02.0: reg 0x18: [mem 0xfebb0000-0xfebb0f=
ff]
[    1.130754][    T1] pci 0000:00:02.0: reg 0x30: [mem 0xfeba0000-0xfebaff=
ff pref]
[    1.132681][    T1] pci 0000:00:03.0: [1af4:1009] type 00 class 0x000200
[    1.133504][    T1] pci 0000:00:03.0: reg 0x10: [io  0xc000-0xc03f]
[    1.134128][    T1] pci 0000:00:03.0: reg 0x14: [mem 0xfebb1000-0xfebb1f=
ff]
[    1.135509][    T1] pci 0000:00:03.0: reg 0x20: [mem 0xfe000000-0xfe003f=
ff 64bit pref]
[    1.139236][    T1] pci 0000:00:04.0: [8086:100e] type 00 class 0x020000
[    1.139894][    T1] pci 0000:00:04.0: reg 0x10: [mem 0xfeb80000-0xfeb9ff=
ff]
[    1.140821][    T1] pci 0000:00:04.0: reg 0x14: [io  0xc040-0xc07f]
[    1.142504][    T1] pci 0000:00:04.0: reg 0x30: [mem 0xfeb00000-0xfeb7ff=
ff pref]
[    1.143637][    T1] pci 0000:00:05.0: [8086:25ab] type 00 class 0x088000
[    1.144256][    T1] pci 0000:00:05.0: reg 0x10: [mem 0xfebb2000-0xfebb20=
0f]
[    1.145942][    T1] pci_bus 0000:00: on NUMA node 0
[    1.148728][    T1] ACPI: PCI: Interrupt link LNKA configured for IRQ 10
[    1.149558][    T1] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
[    1.150346][    T1] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
[    1.150827][    T1] ACPI: PCI: Interrupt link LNKD configured for IRQ 11
[    1.151663][    T1] ACPI: PCI: Interrupt link LNKS configured for IRQ 9
[    1.153322][    T1] iommu: Default domain type: Translated
[    1.153511][    T1] iommu: DMA domain TLB invalidation policy: lazy mode
[    1.154510][   T10] Callback from call_rcu_tasks_rude() invoked.
[    1.155435][    T1] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    1.155504][    T1] pci 0000:00:02.0: vgaarb: VGA device added: decodes=
=3Dio+mem,owns=3Dio+mem,locks=3Dnone
[    1.155512][    T1] pci 0000:00:02.0: vgaarb: bridge control possible
[    1.155936][    T1] vgaarb: loaded
[    1.156855][    T1] ACPI: bus type USB registered
[    1.157322][    T1] usbcore: registered new interface driver usbfs
[    1.157560][    T1] usbcore: registered new interface driver hub
[    1.157988][    T1] usbcore: registered new device driver usb
[    1.158621][    T1] cec: Failed to create debugfs cec dir
[    1.159028][    T1] EDAC MC: Ver: 3.0.0
[    1.160610][    T1] Bluetooth: Core ver 2.22
[    1.160962][    T1] NET: Registered PF_BLUETOOTH protocol family
[    1.161353][    T1] Bluetooth: HCI device and connection manager initial=
ized
[    1.161522][    T1] Bluetooth: HCI socket layer initialized
[    1.161895][    T1] Bluetooth: L2CAP socket layer initialized
[    1.162522][    T1] Bluetooth: SCO socket layer initialized
[    1.163017][    T1] nfc: nfc_init: NFC Core ver 0.1
[    1.163561][    T1] NET: Registered PF_NFC protocol family
[    1.163932][    T1] mctp: management component transport protocol core
[    1.164509][    T1] NET: Registered PF_MCTP protocol family
[    1.164907][    T1] PCI: Using ACPI for IRQ routing
[    1.165260][    T1] PCI: pci_cache_line_size set to 64 bytes
[    1.165575][    T1] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
[    1.166019][    T1] e820: reserve RAM buffer [mem 0xbffe0000-0xbfffffff]
[    1.166901][    T1] clocksource: Switched to clocksource kvm-clock
[    1.167391][    C0] random: fast init done
[    1.222609][    T1] Warning: could not register annotated branches stats
[    1.223286][    T1] VFS: Disk quotas dquot_6.6.0
[    1.223674][    T1] VFS: Dquot-cache hash table entries: 1024 (order 0, =
4096 bytes)
[    1.224480][    T1] pnp: PnP ACPI init
[    1.225264][    T1] pnp 00:03: [dma 2]
[    1.226874][    T1] pnp: PnP ACPI: found 6 devices
[    1.283931][    T1] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xf=
fffff, max_idle_ns: 2085701024 ns
[    1.284597][    T1] NET: Registered PF_INET protocol family
[    1.285094][    T1] IP idents hash table entries: 16384 (order: 5, 13107=
2 bytes, linear)
[    1.285945][    T1] tcp_listen_portaddr_hash hash table entries: 512 (or=
der: 2, 26624 bytes, linear)
[    1.286550][    T1] TCP established hash table entries: 8192 (order: 3, =
32768 bytes, linear)
[    1.287221][    T1] TCP bind hash table entries: 8192 (order: 6, 393216 =
bytes, linear)
[    1.287911][    T1] TCP: Hash tables configured (established 8192 bind 8=
192)
[    1.288568][    T1] MPTCP token hash table entries: 1024 (order: 3, 5734=
4 bytes, linear)
[    1.289207][    T1] UDP hash table entries: 512 (order: 3, 57344 bytes, =
linear)
[    1.289712][    T1] UDP-Lite hash table entries: 512 (order: 3, 57344 by=
tes, linear)
[    1.290340][    T1] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    1.291021][    T9] Callback from call_rcu_tasks() invoked.
[    1.291815][    T1] RPC: Registered named UNIX socket transport module.
[    1.292341][    T1] RPC: Registered udp transport module.
[    1.292697][    T1] RPC: Registered tcp transport module.
[    1.293100][    T1] RPC: Registered tcp NFSv4.1 backchannel transport mo=
dule.
[    1.293571][    T1] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 windo=
w]
[    1.294075][    T1] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff windo=
w]
[    1.294527][    T1] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bff=
ff window]
[    1.295066][    T1] pci_bus 0000:00: resource 7 [mem 0xc0000000-0xfebfff=
ff window]
[    1.295607][    T1] pci 0000:00:01.0: PIIX3: Enabling Passive Release
[    1.296083][    T1] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
[    1.296519][    T1] pci 0000:00:01.0: Activating ISA DMA hang workarounds
[    1.297043][    T1] pci 0000:00:02.0: Video device with shadowed ROM at =
[mem 0x000c0000-0x000dffff]
[    1.297677][    T1] PCI: CLS 0 bytes, default 64
[    1.298375][   T25] Unpacking initramfs...
[    1.921102][   T31] kwatchdog (31) used greatest stack depth: 7288 bytes=
 left
[    4.616955][   T25] Freeing initrd memory: 112528K
[    4.617670][    T1] clocksource: tsc: mask: 0xffffffffffffffff max_cycle=
s: 0x3120346d527, max_idle_ns: 440795374341 ns
[    4.618525][    T1] PCLMULQDQ-NI instructions are not detected.
[    4.618965][    T1] The force parameter has not been set to 1. The Iris =
poweroff handler will not be installed.
[    4.619733][    T1] Beginning ww mutex selftests
[   11.139861][    T1] All ww mutex selftests passed
[   11.143915][    T1] Initialise system trusted keyrings
[   11.144412][    T1] workingset: timestamp_bits=3D30 max_order=3D20 bucke=
t_order=3D0
[   11.145038][    T1] zsmalloc: debugfs not available, stat dir not created
[   11.146285][    T1] fuse: init (API version 7.34)
[   11.146883][    T1] ceph: loaded (mds proto 32)
[   11.155096][    T1] NET: Registered PF_ALG protocol family
[   11.155512][    T1] Key type asymmetric registered
[   11.155915][    T1] test_printf: loaded.
[   11.156233][    T1] test_printf: crng possibly not yet initialized. plai=
n 'p' buffer contains "(ptrval)"
[   11.156247][    T1] test_printf: crng possibly not yet initialized. plai=
n 'p' buffer contains "(ptrval)"
[   11.157092][    T1] test_printf: crng possibly not yet initialized. plai=
n 'p' buffer contains "(ptrval)"
[   11.157875][    T1] test_printf: all 420 tests passed
[   11.158873][    T1] test_scanf: loaded.
[   11.160367][    T1] test_scanf: all 2383 tests passed
[   11.160757][    T1] test_bitmap: loaded.
[   11.161148][    T1] test_bitmap: parselist: 14: input is '0-2047:128/256=
' OK, Time: 528
[   11.163003][    T1] test_bitmap: all 1945 tests passed
[   11.163363][    T1] test_stackinit: u8_zero ok
[   11.163712][    T1] test_stackinit: u16_zero ok
[   11.164012][    T1] test_stackinit: u32_zero ok
[   11.164312][    T1] test_stackinit: u64_zero ok
[   11.164661][    T1] test_stackinit: char_array_zero ok
[   11.165008][    T1] test_stackinit: small_hole_zero ok
[   11.165348][    T1] test_stackinit: big_hole_zero ok
[   11.165728][    T1] test_stackinit: trailing_hole_zero ok
[   11.166083][    T1] test_stackinit: packed_zero ok
[   11.166399][    T1] test_stackinit: small_hole_dynamic_partial ok
[   11.166854][    T1] test_stackinit: big_hole_dynamic_partial ok
[   11.167276][    T1] test_stackinit: trailing_hole_dynamic_partial ok
[   11.167741][    T1] test_stackinit: packed_dynamic_partial ok
[   11.168119][    T1] test_stackinit: small_hole_assigned_dynamic_partial =
ok
[   11.168623][    T1] test_stackinit: big_hole_assigned_dynamic_partial ok
[   11.169061][    T1] test_stackinit: trailing_hole_assigned_dynamic_parti=
al ok
[   11.169543][    T1] test_stackinit: packed_assigned_dynamic_partial ok
[   11.169988][    T1] test_stackinit: small_hole_static_partial ok
[   11.170382][    T1] test_stackinit: big_hole_static_partial ok
[   11.170810][    T1] test_stackinit: trailing_hole_static_partial ok
[   11.171237][    T1] test_stackinit: packed_static_partial ok
[   11.171669][    T1] test_stackinit: small_hole_static_all FAIL (uninit b=
ytes: 3)
[   11.172151][    T1] test_stackinit: big_hole_static_all FAIL (uninit byt=
es: 124)
[   11.172681][    T1] test_stackinit: trailing_hole_static_all FAIL (unini=
t bytes: 3)
[   11.173176][    T1] test_stackinit: packed_static_all ok
[   11.173537][    T1] test_stackinit: small_hole_dynamic_all FAIL (uninit =
bytes: 3)
[   11.174043][    T1] test_stackinit: big_hole_dynamic_all FAIL (uninit by=
tes: 124)
[   11.174542][    T1] test_stackinit: trailing_hole_dynamic_all FAIL (unin=
it bytes: 3)
[   11.175063][    T1] test_stackinit: packed_dynamic_all ok
[   11.175449][    T1] test_stackinit: small_hole_runtime_partial FAIL (uni=
nit bytes: 15)
[   11.176006][    T1] test_stackinit: big_hole_runtime_partial FAIL (unini=
t bytes: 127)
[   11.176513][    T1] test_stackinit: trailing_hole_runtime_partial FAIL (=
uninit bytes: 12)
[   11.177080][    T1] test_stackinit: packed_runtime_partial FAIL (uninit =
bytes: 12)
[   11.177622][    T1] test_stackinit: small_hole_runtime_all FAIL (uninit =
bytes: 3)
[   11.178112][    T1] test_stackinit: big_hole_runtime_all FAIL (uninit by=
tes: 124)
[   11.178645][    T1] test_stackinit: trailing_hole_runtime_all FAIL (unin=
it bytes: 3)
[   11.179150][    T1] test_stackinit: packed_runtime_all ok
[   11.179575][    T1] test_stackinit: small_hole_assigned_static_partial ok
[   11.180030][    T1] test_stackinit: big_hole_assigned_static_partial ok
[   11.180456][    T1] test_stackinit: trailing_hole_assigned_static_partia=
l ok
[   11.180955][    T1] test_stackinit: packed_assigned_static_partial ok
[   11.181376][    T1] test_stackinit: small_hole_assigned_static_all FAIL =
(uninit bytes: 3)
[   11.181943][    T1] test_stackinit: big_hole_assigned_static_all FAIL (u=
ninit bytes: 124)
[   11.182476][    T1] test_stackinit: trailing_hole_assigned_static_all FA=
IL (uninit bytes: 3)
[   11.183056][    T1] test_stackinit: packed_assigned_static_all ok
[   11.183486][    T1] test_stackinit: small_hole_assigned_dynamic_all FAIL=
 (uninit bytes: 3)
[   11.184070][    T1] test_stackinit: big_hole_assigned_dynamic_all FAIL (=
uninit bytes: 124)
[   11.184662][    T1] test_stackinit: trailing_hole_assigned_dynamic_all F=
AIL (uninit bytes: 3)
[   11.185213][    T1] test_stackinit: packed_assigned_dynamic_all ok
[   11.185666][    T1] test_stackinit: small_hole_assigned_copy XFAIL (unin=
it bytes: 3)
[   11.186170][    T1] test_stackinit: big_hole_assigned_copy XFAIL (uninit=
 bytes: 124)
[   11.186721][    T1] test_stackinit: trailing_hole_assigned_copy XFAIL (u=
ninit bytes: 3)
[   11.187275][    T1] test_stackinit: packed_assigned_copy ok
[   11.187687][    T1] test_stackinit: u8_none FAIL (uninit bytes: 1)
[   11.188091][    T1] test_stackinit: u16_none FAIL (uninit bytes: 2)
[   11.188499][    T1] test_stackinit: u32_none FAIL (uninit bytes: 4)
[   11.188947][    T1] test_stackinit: u64_none FAIL (uninit bytes: 8)
[   11.189355][    T1] test_stackinit: char_array_none FAIL (uninit bytes: =
16)
[   11.189852][    T1] test_stackinit: switch_1_none XFAIL (uninit bytes: 8)
[   11.190292][    T1] test_stackinit: switch_2_none XFAIL (uninit bytes: 8)
[   11.190780][    T1] test_stackinit: small_hole_none FAIL (uninit bytes: =
16)
[   11.191255][    T1] test_stackinit: big_hole_none FAIL (uninit bytes: 12=
8)
[   11.191766][    T1] test_stackinit: trailing_hole_none FAIL (uninit byte=
s: 16)
[   11.192236][    T1] test_stackinit: packed_none FAIL (uninit bytes: 16)
[   11.192714][    T1] test_stackinit: user FAIL (uninit bytes: 16)
[   11.193110][    T1] test_stackinit: failures: 29
[   11.193889][    T1] atomic64_test: passed for i586+ platform with CX8 an=
d with SSE
[   11.194388][    T1] start plist test
[   11.197866][    T1] end plist test
[   11.199147][    T1] vmlfb: initializing
[   11.199507][    T1] no IO addresses supplied
[   11.200023][    T1] hgafb: HGA card not detected.
[   11.200338][    T1] hgafb: probe of hgafb.0 failed with error -22
[   11.200877][    T1] usbcore: registered new interface driver smscufx
[   11.201731][    T1] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN=
:00/input/input0
[   11.202709][    T1] ACPI: button: Power Button [PWRF]
[   11.317841][    T1] Serial: 8250/16550 driver, 4 ports, IRQ sharing disa=
bled
[   11.318435][    T1] 00:05: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D =
115200) is a 16550A
[   11.324573][   T39] kworker/u2:2 (39) used greatest stack depth: 6720 by=
tes left
[   11.325111][    T1] lp: driver loaded but no devices found
[   11.325473][    T1] Applicom driver: $Id: ac.c,v 1.30 2000/03/22 16:03:5=
7 dwmw2 Exp $
[   11.326035][    T1] ac.o: No PCI boards found.
[   11.326332][    T1] ac.o: For an ISA board you must supply memory and ir=
q parameters.
[   11.327312][    T1] Non-volatile memory driver v1.3
[   11.327767][    T1] platform pc8736x_gpio.0: NatSemi pc8736x GPIO Driver=
 Initializing
[   11.328289][    T1] platform pc8736x_gpio.0: no device found
[   11.328803][    T1] nsc_gpio initializing
[   11.329082][    T1] telclk_interrupt =3D 0xf non-mcpbl0010 hw.
[   11.329462][    T1] Linux agpgart interface v0.103
[   11.329927][    T1] Hangcheck: starting hangcheck timer 0.9.1 (tick is 1=
80 seconds, margin is 60 seconds).
[   11.332030][    T1] Phantom Linux Driver, version n0.9.8, init OK
[   11.333025][    T1] Guest personality initialized and is inactive
[   11.333854][    T1] VMCI host device registered (name=3Dvmci, major=3D10=
, minor=3D126)
[   11.334340][    T1] Initialized host personality
[   11.336417][    T1] usbcore: registered new interface driver pn533_usb
[   11.339960][    T1] libphy: Fixed MDIO Bus: probed
[   11.345495][    T1] e100: Intel(R) PRO/100 Network Driver
[   11.345904][    T1] e100: Copyright(c) 1999-2006 Intel Corporation
[   11.346353][    T1] e1000: Intel(R) PRO/1000 Network Driver
[   11.346769][    T1] e1000: Copyright (c) 1999-2006 Intel Corporation.
[   11.643537][    T1] ACPI: \_SB_.LNKD: Enabled at IRQ 11
[   11.643893][    T1] PCI: setting IRQ 11 as level-triggered
[   11.936925][    T1] e1000 0000:00:04.0 eth0: (PCI:33MHz:32-bit) 52:54:00=
:12:34:56
[   11.937434][    T1] e1000 0000:00:04.0 eth0: Intel(R) PRO/1000 Network C=
onnection
[   11.938077][    T1] Intel(R) 2.5G Ethernet Linux Driver
[   11.938423][    T1] Copyright(c) 2018 Intel Corporation.
[   11.938909][    T1] myri10ge: Version 1.5.3-1.534
[   11.939307][    T1] ns83820.c: National Semiconductor DP83820 10/100/100=
0 driver.
[   11.941047][   T42] kworker/u2:2 (42) used greatest stack depth: 6488 by=
tes left
[   11.941638][    T1] panel: panel driver not yet registered
[   11.942349][    T1] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) =
Driver
[   11.942883][    T1] ehci-platform: EHCI generic platform driver
[   11.943387][    T1] SPI driver max3421-hcd has no spi_device_id for maxi=
m,max3421
[   11.943971][    T1] usbcore: registered new interface driver cdc_acm
[   11.944388][    T1] cdc_acm: USB Abstract Control Model driver for USB m=
odems and ISDN adapters
[   11.945337][    T1] usbcore: registered new interface driver usblp
[   11.945872][    T1] usbcore: registered new interface driver usbserial_g=
eneric
[   11.946384][    T1] usbserial: USB Serial support registered for generic
[   11.946901][    T1] usbcore: registered new interface driver belkin_sa
[   11.947386][    T1] usbserial: USB Serial support registered for Belkin =
/ Peracom / GoHubs USB Serial Adapter
[   11.948388][    T1] usbcore: registered new interface driver cp210x
[   11.948878][    T1] usbserial: USB Serial support registered for cp210x
[   11.949340][    T1] usbcore: registered new interface driver cyberjack
[   11.949837][    T1] usbserial: USB Serial support registered for Reiner =
SCT Cyberjack USB card reader
[   11.950460][    T1] usbcore: registered new interface driver cypress_m8
[   11.950958][    T1] usbserial: USB Serial support registered for DeLorme=
 Earthmate USB
[   11.951582][    T1] usbserial: USB Serial support registered for HID->CO=
M RS232 Adapter
[   11.952125][    T1] usbserial: USB Serial support registered for Nokia C=
A-42 V2 Adapter
[   11.952838][    T1] usbcore: registered new interface driver digi_accele=
port
[   11.953322][    T1] usbserial: USB Serial support registered for Digi 2 =
port USB adapter
[   11.953912][    T1] usbserial: USB Serial support registered for Digi 4 =
port USB adapter
[   11.954468][    T1] usbcore: registered new interface driver io_edgeport
[   11.954968][    T1] usbserial: USB Serial support registered for Edgepor=
t 2 port adapter
[   11.955611][    T1] usbserial: USB Serial support registered for Edgepor=
t 4 port adapter
[   11.956159][    T1] usbserial: USB Serial support registered for Edgepor=
t 8 port adapter
[   11.957049][    T1] usbserial: USB Serial support registered for EPiC de=
vice
[   11.957592][    T1] usbcore: registered new interface driver kobil_sct
[   11.958043][    T1] usbserial: USB Serial support registered for KOBIL U=
SB smart card terminal
[   11.958681][    T1] usbcore: registered new interface driver mxuport
[   11.959121][    T1] usbserial: USB Serial support registered for MOXA UP=
ort
[   11.959689][    T1] usbcore: registered new interface driver omninet
[   11.960131][    T1] usbserial: USB Serial support registered for ZyXEL -=
 omni.net usb
[   11.961005][    T1] usbcore: registered new interface driver pl2303
[   11.961444][    T1] usbserial: USB Serial support registered for pl2303
[   11.961946][    T1] usbcore: registered new interface driver quatech2
[   11.962395][    T1] usbserial: USB Serial support registered for Quatech=
 2nd gen USB to Serial Driver
[   11.963056][    T1] usbcore: registered new interface driver safe_serial
[   11.963603][    T1] usbserial: USB Serial support registered for safe_se=
rial
[   11.964106][    T1] usbcore: registered new interface driver symbolserial
[   11.964924][    T1] usbserial: USB Serial support registered for symbol
[   11.965463][    T1] usbcore: registered new interface driver adutux
[   11.965995][    T1] usbcore: registered new interface driver appledisplay
[   11.966514][    T1] usbcore: registered new interface driver cypress_cy7=
c63
[   11.967021][    T1] usbcore: registered new interface driver emi26 - fir=
mware loader
[   11.967606][    T1] ftdi_elan: driver ftdi-elan
[   11.967938][    T1] usbcore: registered new interface driver ftdi-elan
[   11.968698][    T1] usbcore: registered new interface driver usblcd
[   11.969143][    T1] usbcore: registered new interface driver trancevibra=
tor
[   11.969750][    T1] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU=
] at 0x60,0x64 irq 1,12
[   11.971453][    T1] serio: i8042 KBD port at 0x60,0x64 irq 1
[   11.971929][    T1] serio: i8042 AUX port at 0x60,0x64 irq 12
[   11.973562][    T1] Driver for 1-wire Dallas network protocol.
[   11.974189][    T1] usbcore: registered new interface driver DS9490R
[   11.974678][    T1] DS1WM w1 busmaster driver - (c) 2004 Szabolcs Gyurko
[   11.978270][    T5] input: AT Translated Set 2 keyboard as /devices/plat=
form/i8042/serio0/input/input1
[   11.981755][    T1] Bluetooth: HCI UART driver ver 2.3
[   11.982105][    T1] Bluetooth: HCI UART protocol H4 registered
[   11.982488][    T1] Bluetooth: HCI UART protocol BCSP registered
[   11.983035][    T1] Bluetooth: HCI UART protocol LL registered
[   11.983556][    T1] Bluetooth: HCI UART protocol Intel registered
[   11.984153][    T1] Bluetooth: HCI UART protocol Broadcom registered
[   11.984660][    T1] usbcore: registered new interface driver bcm203x
[   11.986130][    T1] platform eisa.0: Probing EISA bus 0
[   11.986484][    T1] platform eisa.0: EISA: Cannot allocate resource for =
mainboard
[   11.987020][    T1] platform eisa.0: Cannot allocate resource for EISA s=
lot 1
[   11.987611][    T1] platform eisa.0: Cannot allocate resource for EISA s=
lot 2
[   11.988077][    T1] platform eisa.0: Cannot allocate resource for EISA s=
lot 3
[   11.988594][    T1] platform eisa.0: Cannot allocate resource for EISA s=
lot 4
[   11.989062][    T1] platform eisa.0: Cannot allocate resource for EISA s=
lot 5
[   11.989577][    T1] platform eisa.0: Cannot allocate resource for EISA s=
lot 6
[   11.990042][    T1] platform eisa.0: Cannot allocate resource for EISA s=
lot 7
[   11.990532][    T1] platform eisa.0: Cannot allocate resource for EISA s=
lot 8
[   11.991045][    T1] platform eisa.0: EISA: Detected 0 cards
[   11.991662][    T1] sdhci: Secure Digital Host Controller Interface driv=
er
[   11.992128][    T1] sdhci: Copyright(c) Pierre Ossman
[   11.992533][    T1] SPI driver mmc_spi has no spi_device_id for mmc-spi-=
slot
[   11.993088][    T1] usbcore: registered new interface driver ushc
[   11.993920][    T1] sdhci-pltfm: SDHCI platform and OF driver helper
[   11.994411][    T1]     # Subtest: sdhci-of-aspeed
[   11.994413][    T1]     1..2
[   11.994889][    T1]     ok 1 - aspeed_sdhci_phase_ddr52
[   11.995168][    T1]     ok 2 - aspeed_sdhci_phase_hs200
[   11.995617][    T1] # sdhci-of-aspeed: pass:2 fail:0 skip:0 total:2
[   11.995965][    T1] # Totals: pass:2 fail:0 skip:0 total:2
[   11.996401][    T1] ok 1 - sdhci-of-aspeed
[   11.998840][    T1] usbcore: registered new interface driver usbhid
[   11.999290][    T1] usbhid: USB HID core driver
[   12.000438][    T1] greybus: registered new driver vibrator
[   12.000869][    T1] axis-fifo driver loaded with parameters read_timeout=
 =3D 1000, write_timeout =3D 1000
[   12.003500][    T1] SPI driver st-accel-spi has no spi_device_id for st,=
lis302dl-spi
[   12.004080][    T1] SPI driver st-accel-spi has no spi_device_id for st,=
lis3lv02dl-accel
[   12.004660][    T1] SPI driver st-accel-spi has no spi_device_id for st,=
lis3dh-accel
[   12.005190][    T1] SPI driver st-accel-spi has no spi_device_id for st,=
lsm330d-accel
[   12.005783][    T1] SPI driver st-accel-spi has no spi_device_id for st,=
lsm330dl-accel
[   12.006324][    T1] SPI driver st-accel-spi has no spi_device_id for st,=
lsm330dlc-accel
[   12.006885][    T1] SPI driver st-accel-spi has no spi_device_id for st,=
lis331dlh-accel
[   12.007569][    T1] SPI driver st-accel-spi has no spi_device_id for st,=
lsm330-accel
[   12.008070][    T1] SPI driver st-accel-spi has no spi_device_id for st,=
lsm303agr-accel
[   12.008669][    T1] SPI driver st-accel-spi has no spi_device_id for st,=
lis2dh12-accel
[   12.009213][    T1] SPI driver st-accel-spi has no spi_device_id for st,=
lng2dm-accel
[   12.009765][    T1] SPI driver st-accel-spi has no spi_device_id for st,=
h3lis331dl-accel
[   12.010291][    T1] SPI driver st-accel-spi has no spi_device_id for st,=
lis331dl-accel
[   12.012015][    T1] SPI driver tsc2046 has no spi_device_id for ti,tsc20=
46e-adc
[   12.014624][    T1] SPI driver st-lsm9ds0-spi has no spi_device_id for s=
t,lsm9ds0-imu
[   12.016269][    T1] SPI driver st-magn-spi has no spi_device_id for st,l=
is3mdl-magn
[   12.016834][    T1] SPI driver st-magn-spi has no spi_device_id for st,l=
sm303agr-magn
[   12.017345][    T1] SPI driver st-magn-spi has no spi_device_id for st,l=
sm9ds1-magn
[   12.019906][    T1] Simple TC action Loaded
[   12.020266][    T1] ipip: IPv4 and MPLS over IPv4 tunneling driver
[   12.021932][    T1] Initializing XFRM netlink socket
[   12.022514][    T1] NET: Registered PF_PACKET protocol family
[   12.022926][    T1] NET: Registered PF_KEY protocol family
[   12.023324][    T1] NET: Registered PF_X25 protocol family
[   12.023754][    T1] X25: Linux Version 0.2
[   12.024127][    T1] Bluetooth: RFCOMM TTY layer initialized
[   12.024517][    T1] Bluetooth: RFCOMM socket layer initialized
[   12.024932][    T1] Bluetooth: RFCOMM ver 1.11
[   12.025394][    T1] NET: Registered PF_RXRPC protocol family
[   12.025863][    T1] Key type rxrpc registered
[   12.026171][    T1] Key type rxrpc_s registered
[   12.026778][    T1] NET4: DECnet for Linux: V.2.5.68s (C) 1995-2003 Linu=
x DECnet Project Team
[   12.027818][    T1] DECnet: Routing cache hash table of 1024 buckets, 48=
Kbytes
[   12.028346][    T1] NET: Registered PF_DECnet protocol family
[   12.028791][    T1] 9pnet: Installing 9P2000 support
[   12.029184][    T1] NET: Registered PF_CAIF protocol family
[   12.029626][    T1] Key type dns_resolver registered
[   12.029957][    T1] Key type ceph registered
[   12.030478][    T1] libceph: loaded (mon/osd proto 15/24)
[   12.031343][    T1] openvswitch: Open vSwitch switching datapath
[   12.032061][    T1] mpls_gso: MPLS GSO support
[   12.032699][    T1] sched_clock: Marking stable (12025670971, 6868057)->=
(12052389256, -19850228)
[   12.033642][    T1] Loading compiled-in X.509 certificates
[   12.034039][    T1] debug_vm_pgtable: [debug_vm_pgtable         ]: Valid=
ating architecture page table helpers
[   12.035208][    T1] kAFS: Red Hat AFS client v0.1 registering.
[   12.041627][    T1] kAFS: failed to register: -97
[   12.043228][    T1] Key type encrypted registered
[   12.050824][    T1] PM:   Magic number: 13:838:425
[   12.610348][    T5] input: ImExPS/2 Generic Explorer Mouse as /devices/p=
latform/i8042/serio1/input/input3
[   12.626345][    T5] e1000: eth0 NIC Link is Up 1000 Mbps Full Duplex, Fl=
ow Control: RX
[   12.641699][    T1] Sending DHCP requests .
[   13.324878][    C0] random: crng init done
[   13.624686][    T1] , OK
[   13.626707][    T1] IP-Config: Got DHCP answer from 10.0.2.2, my address=
 is 10.0.2.15
[   13.629885][    T1] IP-Config: Complete:
[   13.631452][    T1]      device=3Deth0, hwaddr=3D52:54:00:12:34:56, ipad=
dr=3D10.0.2.15, mask=3D255.255.255.0, gw=3D10.0.2.2
[   13.635296][    T1]      host=3D10.0.2.15, domain=3D, nis-domain=3D(none)
[   13.637754][    T1]      bootserver=3D10.0.2.2, rootserver=3D10.0.2.2, r=
ootpath=3D
[   13.637768][    T1]      nameserver0=3D10.0.2.3
[   13.644706][    T1] Bluetooth: Starting self testing
[   13.646680][    T1] Bluetooth: Finished self testing
[   13.648884][    T1] TAP version 14
[   13.650246][    T1] 1..7
[   13.651313][    T1]     # Subtest: resource
[   13.651323][    T1]     1..2
[   13.654083][    T1]     ok 1 - resource_test_union
[   13.655387][    T1]     ok 2 - resource_test_intersection
[   13.656774][    T1] # resource: pass:2 fail:0 skip:0 total:2
[   13.658038][    T1] # Totals: pass:2 fail:0 skip:0 total:2
[   13.659173][    T1] ok 2 - resource
[   13.660991][    T1]     # Subtest: damon
[   13.660997][    T1]     1..7
[   13.662045][    T1]     ok 1 - damon_test_target
[   13.662838][    T1]     ok 2 - damon_test_regions
[   13.663848][    T1]     ok 3 - damon_test_aggregate
[   13.665314][    T1]     ok 4 - damon_test_split_at
[   13.666322][    T1]     ok 5 - damon_test_merge_two
[   13.667343][    T1]     ok 6 - damon_test_merge_regions_of
[   13.668222][    T1]     ok 7 - damon_test_split_regions_of
[   13.669002][    T1] # damon: pass:7 fail:0 skip:0 total:7
[   13.669745][    T1] # Totals: pass:7 fail:0 skip:0 total:7
[   13.670449][    T1] ok 3 - damon
[   13.671647][    T1]     # Subtest: bits-test
[   13.671651][    T1]     1..3
[   13.672350][    T1]     ok 1 - genmask_test
[   13.673145][    T1]     ok 2 - genmask_ull_test
[   13.673819][    T1]     ok 3 - genmask_input_check_test
[   13.674337][    T1] # bits-test: pass:3 fail:0 skip:0 total:3
[   13.674971][    T1] # Totals: pass:3 fail:0 skip:0 total:3
[   13.675651][    T1] ok 4 - bits-test
[   13.676688][    T1]     # Subtest: cmdline
[   13.676691][    T1]     1..4
[   13.677275][    T1]     ok 1 - cmdline_test_noint
[   13.677763][    T1]     ok 2 - cmdline_test_lead_int
[   13.678331][    T1]     ok 3 - cmdline_test_tail_int
[   13.678976][    T1]     ok 4 - cmdline_test_range
[   13.679468][    T1] # cmdline: pass:4 fail:0 skip:0 total:4
[   13.679965][    T1] # Totals: pass:4 fail:0 skip:0 total:4
[   13.680542][    T1] ok 5 - cmdline
[   13.681406][    T1]     # Subtest: property-entry
[   13.681409][    T1]     1..7
[   13.682053][    T1]     ok 1 - pe_test_uints
[   13.682546][    T1]     ok 2 - pe_test_uint_arrays
[   13.683094][    T1]     ok 3 - pe_test_strings
[   13.683723][    T1]     ok 4 - pe_test_bool
[   13.684207][    T1]     ok 5 - pe_test_move_inline_u8
[   13.684725][    T1]     ok 6 - pe_test_move_inline_str
[   13.685315][    T1]     ok 7 - pe_test_reference
[   13.685814][    T1] # property-entry: pass:7 fail:0 skip:0 total:7
[   13.686217][    T1] # Totals: pass:7 fail:0 skip:0 total:7
[   13.686768][    T1] ok 6 - property-entry
[   13.687614][    T1]     # Subtest: sdhci-of-aspeed
[   13.687616][    T1]     1..2
[   13.688306][    T1]     ok 1 - aspeed_sdhci_phase_ddr52
[   13.688676][    T1]     ok 2 - aspeed_sdhci_phase_hs200
[   13.689088][    T1] # sdhci-of-aspeed: pass:2 fail:0 skip:0 total:2
[   13.689546][    T1] # Totals: pass:2 fail:0 skip:0 total:2
[   13.690032][    T1] ok 7 - sdhci-of-aspeed
[   13.690800][    T1]     # Subtest: iio-format
[   13.690802][    T1]     1..5
[   13.691251][    T1]     ok 1 - iio_test_iio_format_value_integer
[   13.691632][    T1]     ok 2 - iio_test_iio_format_value_fixedpoint
[   13.692190][    T1]     ok 3 - iio_test_iio_format_value_fractional
[   13.692936][    T1]     ok 4 - iio_test_iio_format_value_fractional_log2
[   13.693497][    T1]     ok 5 - iio_test_iio_format_value_multiple
[   13.693978][    T1] # iio-format: pass:5 fail:0 skip:0 total:5
[   13.694409][    T1] # Totals: pass:5 fail:0 skip:0 total:5
[   13.694837][    T1] ok 8 - iio-format
[   13.702011][    T1] Freeing unused kernel image (initmem) memory: 996K
[   13.702637][    T1] Write protecting kernel text and read-only data: 253=
24k
[   13.705740][    T1] Run /init as init process
[   13.706041][    T1]   with arguments:
[   13.706294][    T1]     /init
[   13.706580][    T1]   with environment:
[   13.706844][    T1]     HOME=3D/
[   13.707054][    T1]     TERM=3Dlinux
[   13.707289][    T1]     user=3Dlkp
[   13.707542][    T1]     job=3D/lkp/jobs/scheduled/vm-snb-i386-39/boot-1-=
debian-i386-20191205.cgz-7482e3841d520a368426ac196720601687e2dc47-20211104-=
18628-2k9id3-1.yaml
[   13.708542][    T1]     ARCH=3Di386
[   13.708772][    T1]     kconfig=3Di386-randconfig-a015-20211103
[   13.709161][    T1]     branch=3Dtnguy-next-queue/dev-queue
[   13.709593][    T1]     commit=3D7482e3841d520a368426ac196720601687e2dc47
[   13.710039][    T1]     BOOT_IMAGE=3D/pkg/linux/i386-randconfig-a015-202=
11103/gcc-9/7482e3841d520a368426ac196720601687e2dc47/vmlinuz-5.15.0-rc4-011=
67-g7482e3841d52
[   13.711009][    T1]     max_uptime=3D600
[   13.711276][    T1]     RESULT_ROOT=3D/result/boot/1/vm-snb-i386/debian-=
i386-20191205.cgz/i386-randconfig-a015-20211103/gcc-9/7482e3841d520a368426a=
c196720601687e2dc47/3
[   13.712273][    T1]     LKP_LOCAL_RUN=3D1
[   13.712563][    T1]     selinux=3D0
[   13.712794][    T1]     apic=3Ddebug
[   13.713027][    T1]     softlockup_panic=3D1
[   13.713306][    T1]     nmi_watchdog=3Dpanic
[   13.713600][    T1]     prompt_ramdisk=3D0
[   13.713871][    T1]     vga=3Dnormal
[   13.714104][    T1]     result_service=3D9p/virtfs_mount
[   13.724755][    T1] systemd[1]: RTC configured in localtime, applying de=
lta of 0 minutes to system time.

Welcome to Debian GNU/Linux 9 (stretch)!

[   13.754944][  T139] systemd-getty-g (139) used greatest stack depth: 629=
6 bytes left
[   13.781630][  T138] process 138 (systemd) attempted a POSIX timer syscal=
l while CONFIG_POSIX_TIMERS is not set
[   13.786398][  T142] systemd-fstab-g (142) used greatest stack depth: 620=
0 bytes left
[  OK  ] Started Forward Password Requests to Wall Directory Watch.
[  OK  ] Created slice System Slice.
[  OK  ] Set up automount Arbitrary Executab=E2=80=A6rmats File System Auto=
mount Point.
[  OK  ] Listening on udev Control Socket.
[  OK  ] Reached target Swap.
[  OK  ] Started Dispatch Password Requests to Console Directory Watch.
[  OK  ] Created slice system-getty.slice.
[  OK  ] Listening on Syslog Socket.
[  OK  ] Reached target Encrypted Volumes.
          Mounting RPC Pipe File System...
[  OK  ] Listening on udev Kernel Socket.
[  OK  ] Listening on Journal Socket (/dev/log).
[  OK  ] Created slice User and Session Slice.
[  OK  ] Reached target Slices.
[  OK  ] Listening on RPCbind Server Activation Socket.
[  OK  ] Listening on Journal Socket.
          Starting Journal Service...
          Starting Create Static Device Nodes in /dev...
          Starting Remount Root and Kernel File Systems...
          Starting Load Kernel Modules...
[  OK  ] Reached target Paths.
[  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
[  OK  ] Mounted RPC Pipe File System.
[  OK  ] Started Create Static Device Nodes in /dev.
[  OK  ] Started Remount Root and Kernel File Systems.
          Starting Load/Save Random Seed...
          Starting udev Coldplug all Devices...
[  OK  ] Reached target Local File Systems (Pre).
[  OK  ] Reached target Local File Systems.
          Starting Preprocess NFS configuration...
          Starting udev Kernel Device Manager...
[  OK  ] Started Load Kernel Modules.
[  OK  ] Started Load/Save Random Seed.
          Starting Apply Kernel Variables...
          Mounting FUSE Control File System...
          Mounting Configuration File System...
[  OK  ] Started Preprocess NFS configuration.
[  OK  ] Mounted FUSE Control File System.
[  OK  ] Started Apply Kernel Variables.
[  OK  ] Mounted Configuration File System.
[  OK  ] Started udev Kernel Device Manager.
          Starting Raise network interfaces...
[  OK  ] Reached target NFS client services.
[   14.079160][  T181] ip (181) used greatest stack depth: 5984 bytes left
[  OK  ] Started Journal Service.
          Starting Flush Journal to Persistent Storage...
[  OK  ] Started Flush Journal to Persistent Storage.
          Starting Create Volatile Files and Directories...
[   14.170528][  T193] systemctl (193) used greatest stack depth: 5936 byte=
s left
[  OK  ] Started Create Volatile Files and Directories.
          Starting Network Time Synchronization...
          Starting Update UTMP about System Boot/Shutdown...
          Starting RPC bind portmap service...
[FAILED] Failed to start Update UTMP about System Boot/Shutdown.
See 'systemctl status systemd-update-utmp.service' for details.
[DEPEND] Dependency failed for Update UTMP about System Runlevel Changes.
[   14.283065][  T204] systemctl (204) used greatest stack depth: 5928 byte=
s left
[  OK  ] Started RPC bind portmap service.
[  OK  ] Reached target RPC Port Mapper.
[  OK  ] Reached target Remote File Systems (Pre).
[  OK  ] Reached target Remote File Systems.
[  OK  ] Started Raise network interfaces.
[  OK  ] Reached target Network.
[  OK  ] Reached target Network is Online.
[  OK  ] Started Network Time Synchronization.
[  OK  ] Reached target System Time Synchronized.
[  OK  ] Started udev Coldplug all Devices.
[  OK  ] Reached target System Initialization.
[  OK  ] Listening on D-Bus System Message Bus Socket.
[  OK  ] Reached target Sockets.
[  OK  ] Reached target Basic System.
[  OK  ] Started D-Bus System Message Bus.
[  OK  ] Started Regular background program processing daemon.
          Starting LSB: Start and stop bmc-watchdog...
          Starting Permit User Sessions...
          Starting OpenBSD Secure Shell server...
          Starting System Logging Service...
          Starting LKP bootstrap...
          Starting /etc/rc.local Compatibility...
[  OK  ] Started Daily apt download activities.
[  OK  ] Started Daily apt upgrade and clean activities.
          Starting Login Service...
          Starting LSB: Execute the kexec -e command to reboot system...
[  OK  ] Started Daily Cleanup of Temporary Directories.
[  OK  ] Reached target Timers.
[  OK  ] Started Permit User Sessions.
[   16.663087] rc.local[255]: mkdir: cannot create directory '/var/lock/lkp=
-bootstrap.lock': File exists
[  OK  ] Started LKP bootstrap.
[  OK  ] Started LSB: Start and stop bmc-watchdog.
[  OK  ] Started Login Service.
[  OK  ] Started OpenBSD Secure Shell server.
[  OK  ] Started LSB: Execute the kexec -e command to reboot system.
          Starting LSB: Load kernel image with kexec...
[  OK  ] Started LSB: Load kernel image with kexec.
LKP: HOSTNAME vm-snb-i386-39, MAC 52:54:00:12:34:56, kernel 5.15.0-04621-g4=
36014e860d3 1, serial console /dev/ttyS0
[   23.865832][  T293] Kernel tests: Boot OK!
[   23.865839][  T293]
[   24.854677][  T273] sysrq: Emergency Sync
[   24.855136][  T273] sysrq: Resetting
root(a)fr-c3-small-x86-01:~/net/lkp-tests#

Thanks,
Daniel

--===============5275818753636082228==--

