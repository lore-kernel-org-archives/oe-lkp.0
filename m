Content-Type: multipart/mixed; boundary="===============7880947966817364926=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] f5caf621ee: PANIC:double_fault
Date: Thu, 28 Sep 2017 09:21:07 -0700
Message-ID: <CA+55aFwL0DGcxciSbPEGNpOgxveBsr3=qnm6Xx4CfFrxhkMQxg@mail.gmail.com>
In-Reply-To: <20170928074758.GS17200@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7880947966817364926==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2017 at 12:47 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> [   10.587519] RIP: 0010:compat_sock_ioctl+0xfea/0x103e
> [   10.587974] RSP: 0000:0000000000277d78 EFLAGS: 00010283
> [   10.588448] RAX: 0000000000277d78 RBX: 0000000000008933 RCX: ffff88001=
41a8000
> [   10.589103] RDX: 0000000000000020 RSI: 00000000fffbea00 RDI: 00000000f=
ffbea50
> [   10.589757] RBP: ffffc90000277e18 R08: fffbea50fffbea34 R09: ffffffff8=
14a68c9
> [   10.590407] R10: ffffff9c00000002 R11: 00000000fffbea50 R12: 000000000=
0000000
> [   10.591056] R13: ffff880012c8c880 R14: 00000000fffbea50 R15: 00000000f=
ffbea00
> [   10.591708] FS:  0000000000000000(0000) GS:ffff880019a00000(0063) knlG=
S:00000000f7fab9a0
> [   10.592446] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
> [   10.592973] CR2: 0000000000277d68 CR3: 000000001807f000 CR4: 000000000=
00006b0
> [   10.593623] Call Trace:
> [   10.593858] Code: 02 0f ff 65 48 8b 04 25 80 d1 00 00 48 8b 80 28 25 0=
0 00 48 83 e8 20 49 39 c7 77 34 89 e0 4c 89 f7 4c 89 fe ba 20 00 00 00 89 c=
4 <e8> b3 52 05 00 85 c0 74 22 eb 1a 4c 89 fa 89 de 4c 89 ef e8 c6
> [   10.595705] Kernel panic - not syncing: Machine halted.

That is some _funky_ code, and yes, this may well be triggered by the
inline asm changes.

The code decodes to (after ignoring a few bytes at the beginning that
were in the middle of an instruction)

   0: 65 48 8b 04 25 80 d1 mov    %gs:0xd180,%rax
   7: 00 00
   9: 48 8b 80 28 25 00 00 mov    0x2528(%rax),%rax
  10: 48 83 e8 20          sub    $0x20,%rax
  14: 49 39 c7              cmp    %rax,%r15
  17: 77 34                ja     0x4d
  19: 89 e0                mov    %esp,%eax
  1b: 4c 89 f7              mov    %r14,%rdi
  1e: 4c 89 fe              mov    %r15,%rsi
  21: ba 20 00 00 00        mov    $0x20,%edx
  26: 89 c4                mov    %eax,%esp
  28:* e8 b3 52 05 00        callq  0x552e0 <-- trapping instruction
  2d: 85 c0                test   %eax,%eax
  2f: 74 22                je     0x53
  31: eb 1a                jmp    0x4d
  33: 4c 89 fa              mov    %r15,%rdx
  36: 89 de                mov    %ebx,%esi
  38: 4c 89 ef              mov    %r13,%rdi

and it's worth noting that insane

     mov    %eax,%esp

instruction, and how RAX (and RSP) both have that bad value of
0000000000277d78 in them.

So double fault is correct - we've corrupted the stack.

And NOTE! It's reloading 32 bits, not 64 bits, and that's the basic bug the=
re.

I do note that when I build a kernel, I do see that pattern of

    movl    $32, %edx
    call <something>

and in every case it's a a call to a user copy. One is "call
_copy_from_user", while the other ones are all the
alternative_call_2() in copy_user_generic().

Judging by the offset within the function, and judging by the bug,
it's almost certainly that alternative_call_2() case.

So it does sound like the clang fix has now introduced a gcc regression.

And yes, in both cases it seems to be a compiler bug, but I'm not
convinced it's a good idea to fix a clang bug by introducing a gcc
one.

Anyway, I think the real hint here is that 32-bit reload.

Lookie here:

  register unsigned int __asm_call_sp asm("esp");
  #define ASM_CALL_CONSTRAINT "+r" (__asm_call_sp)

yeah, that's just garbage. It sure as hell should not be "unsigned int".

Yeah. yeah, gcc shouldn't do that insane reload in the first place,
but once that gcc bug has triggered, then the "unsigned int" is what
makes the code go really bad.

I bet that changing it to "unsigned long" will just fix things.

Josh?

            Linus

--===============7880947966817364926==--

