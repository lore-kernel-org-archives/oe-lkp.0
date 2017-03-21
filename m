Content-Type: multipart/mixed; boundary="===============5144383258706517631=="
MIME-Version: 1.0
From: Andy Lutomirski <luto@amacapital.net>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86] 69218e4799: BUG:kernel_hang_in_boot_stage
Date: Tue, 21 Mar 2017 15:32:00 -0700
Message-ID: <CALCETrUJWp-99dbU0Yq08jCkf7N+N+hD_5FUVdKc+aY6fZhLmA@mail.gmail.com>
In-Reply-To: <CA+55aFzS=X5J9QXbF_oXdO3KTrGjzA6BpGfdLo8BiuuU81cOPw@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5144383258706517631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2017 at 2:11 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Tue, Mar 21, 2017 at 1:25 PM, Thomas Garnier <thgarnie@google.com> w=
rote:
>> The issue seems to be related to exceptions happening in close pages
>> to the fixmap GDT remapping.
>>
>> The original page fault happen in do_test_wp_bit which set a fixmap
>> entry to test WP flag. If I grow the number of processors supported
>> increasing the distance between the remapped GDT page and the WP test
>> page, the error does not reproduce.
>>
>> I am still looking at the exact distance between repro and no-repro as
>> well as the exact root cause.
>
> Hmm. Have we set the GDT limit incorrectly, somehow? The GDT *can*
> cover 8k entries, which at 8 bytes each would be 64kB.

The QEMU barf says the GDT limit is 0xff, for better or for worse.

>
> So somebody trying to load an invalid segment (say, 0xffff) might end
> up causing an access to the GDT base + 64k - 8.
>
> It is also possible that the CPU might do a page table writability
> check *before* it does the limit check. That would sound odd, though.
> Might be a CPU errata.
>

I added a global TLB flush right after __set_fixmap(), with no effect.
I instrumented the code a bit and I see:

[    0.000000] Checking if this processor honours the WP bit even in
supervisor mode...
[    0.000000] Will do WP test: PA 258b000 VA ff874000 GDTRW 547e0000
GDTRO ffa94000
KVM internal error. Suberror: 3
extra data[0]: 80000b0e
extra data[1]: 31
EAX=3D00000001 EBX=3Dcbb13bc3 ECX=3D00000000 EDX=3Dfffff000
ESI=3D547e0000 EDI=3Dffa94000 EBP=3D42201f4c ESP=3D42201f4c
EIP=3D4105819d EFL=3D00210006 [-----P-] CPL=3D0 II=3D0 A20=3D1 SMM=3D0 HLT=
=3D0
ES =3D007b 00000000 ffffffff 00c0f300 DPL=3D3 DS   [-WA]
CS =3D0060 00000000 ffffffff 00c09b00 DPL=3D0 CS32 [-RA]
SS =3D0068 00000000 ffffffff 00c09300 DPL=3D0 DS   [-WA]
DS =3D007b 00000000 ffffffff 00c0f300 DPL=3D3 DS   [-WA]
FS =3D00d8 123b2000 ffffffff 00809300 DPL=3D0 DS16 [-WA]
GS =3D00e0 5492d300 00000018 00409100 DPL=3D0 DS   [--A]
LDT=3D0000 00000000 ffffffff 00000000
TR =3D0080 5492b180 0000206b 00008b00 DPL=3D0 TSS32-busy
GDT=3D     ffa94000 000000ff
IDT=3D     fffba000 000007ff
CR0=3D80050033 CR2=3Dff874000 CR3=3D0258b000 CR4=3D00040690
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000
DR3=3D0000000000000000
DR6=3D00000000fffe0ff0 DR7=3D0000000000000400
EFER=3D0000000000000000
Code=3D58 d1 00 b8 01 00 00 00 8b 15 ac 13 22 42 8a 8a 00 50 87 ff <88>
8a 00 50 87 ff 31 c0 5d c3 90 90 90 90 90 90 90 90 90 55 2d 84 02 00
00 89 e5 e8 c3 05

The faulting instruction is, as expected:

   e:    8a 8a 00 50 87 ff        mov    -0x78b000(%rdx),%cl
  14:*    88 8a 00 50 87 ff        mov    %cl,-0x78b000(%rdx)
<-- trapping instruction

CR2 is what we expect.  It would be nice to see the GPA and GLA for
the EPT misconfiguration, but KVM doesn't appear to show it.

I doubt we're looking@an erratum here.  QEMU TCG triple-faults:

[    0.000000] Will do WP test: PA 258b000 VA ff874000 GDTRW 547e0000
GDTRO ffa94000

check_exception old: 0xffffffff new 0xe [#PF]
     0: v=3D0e e=3D0003 i=3D0 cpl=3D0 IP=3D0060:000000004105819d
pc=3D000000004105819d SP=3D0068:0000000042201f4c CR2=3D00000000ff874000
EAX=3D00000001 EBX=3D88eed8df ECX=3D00000000 EDX=3Dfffff000
ESI=3D547e0000 EDI=3Dffa94000 EBP=3D42201f4c ESP=3D42201f4c
EIP=3D4105819d EFL=3D00200006 [-----P-] CPL=3D0 II=3D0 A20=3D1 SMM=3D0 HLT=
=3D0
ES =3D007b 00000000 ffffffff 00cff300 DPL=3D3 DS   [-WA]
CS =3D0060 00000000 ffffffff 00cf9a00 DPL=3D0 CS32 [-R-]
SS =3D0068 00000000 ffffffff 00cf9300 DPL=3D0 DS   [-WA]
DS =3D007b 00000000 ffffffff 00cff300 DPL=3D3 DS   [-WA]
FS =3D00d8 123b2000 ffffffff 008f9300 DPL=3D0 DS16 [-WA]
GS =3D00e0 5492d300 00000018 00409100 DPL=3D0 DS   [--A]
LDT=3D0000 00000000 00000000 00008200 DPL=3D0 LDT
TR =3D0080 5492b180 0000206b 00008900 DPL=3D0 TSS32-avl
GDT=3D     ffa94000 000000ff
IDT=3D     fffba000 000007ff
CR0=3D80050033 CR2=3Dff874000 CR3=3D0258b000 CR4=3D00000690
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000
DR3=3D0000000000000000
DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
CCS=3D00000004 CCD=3D42201f3c CCO=3DADDL
EFER=3D0000000000000000
check_exception old: 0xe new 0xd [#GP]
     1: v=3D08 e=3D0000 i=3D0 cpl=3D0 IP=3D0060:000000004105819d
pc=3D000000004105819d SP=3D0068:0000000042201f4c
env->regs[R_EAX]=3D0000000000000001
EAX=3D00000001 EBX=3D88eed8df ECX=3D00000000 EDX=3Dfffff000
ESI=3D547e0000 EDI=3Dffa94000 EBP=3D42201f4c ESP=3D42201f4c
EIP=3D4105819d EFL=3D00200006 [-----P-] CPL=3D0 II=3D0 A20=3D1 SMM=3D0 HLT=
=3D0
ES =3D007b 00000000 ffffffff 00cff300 DPL=3D3 DS   [-WA]
CS =3D0060 00000000 ffffffff 00cf9a00 DPL=3D0 CS32 [-R-]
SS =3D0068 00000000 ffffffff 00cf9300 DPL=3D0 DS   [-WA]
DS =3D007b 00000000 ffffffff 00cff300 DPL=3D3 DS   [-WA]
FS =3D00d8 123b2000 ffffffff 008f9300 DPL=3D0 DS16 [-WA]
GS =3D00e0 5492d300 00000018 00409100 DPL=3D0 DS   [--A]
LDT=3D0000 00000000 00000000 00008200 DPL=3D0 LDT
TR =3D0080 5492b180 0000206b 00008900 DPL=3D0 TSS32-avl
GDT=3D     ffa94000 000000ff
IDT=3D     fffba000 000007ff
CR0=3D80050033 CR2=3Dff874000 CR3=3D0258b000 CR4=3D00000690
DR0=3D0000000000000000 DR1=3D0000000000000000 DR2=3D0000000000000000
DR3=3D0000000000000000
DR6=3D00000000ffff0ff0 DR7=3D0000000000000400
CCS=3D00000004 CCD=3D42201f3c CCO=3DADDL
EFER=3D0000000000000000
check_exception old: 0x8 new 0xd
Triple fault

There's presumably something genuinely wrong with our GDT.

--===============5144383258706517631==--

