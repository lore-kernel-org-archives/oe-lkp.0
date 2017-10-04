Content-Type: multipart/mixed; boundary="===============2035686828826770295=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Wed, 04 Oct 2017 17:15:38 -0500
Message-ID: <20171004221538.sw2u5pc32pysfetf@treble>
In-Reply-To: <CA+55aFy9r2GAFenswm92sdz0qnbazPcofm668JqYrxEVFALfZA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2035686828826770295==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 04, 2017 at 02:30:42PM -0700, Linus Torvalds wrote:
> On Wed, Oct 4, 2017 at 2:06 PM, Josh Poimboeuf <jpoimboe@redhat.com> wr=
ote:
> >
> > I compiled the same kernel with a similar version of GCC.  It turns out
> > that GCC *does* create unaligned stacks with frame pointers enabled:
> =

> Christ. What a piece of crap.
> =

> It doesn't even seem to make any sense. Spill room for the "u16
> item_count" and "u8 move_type"?

I didn't have the patience to try to figure out what it thought it was
trying to do.  But it doesn't even use %esp in the function, so it's
obviously just pointless code.  Pasting the full function below.

> That function is disgusting anyway (the switch really should be
> outside the loop, not inside it), but whatever. No excuse for that
> kind of garbage code generation.
> =

> > This was a leaf function.  For no apparent reason, GCC 4.8 decided to
> > subtract 3 from the stack pointer in the prologue.
> =

> Can you make objtool warn about unaligned stack pointer additions like th=
at?

That should be easy to add, and a good idea to check for.  I don't look
forward to the continual 0-day bot complaints, so hopefully we can
figure out a way to fix them (or deprecate GCC 4!), or at least disable
the checking for older versions of GCC with the known issue.

> Maybe it only happens in very limited cases, and we can find a pattern
> to why gcc generates garbage code like that? And perhaps even how to
> just avoid it?

Just from grepping the objdump I can tell it happened in several
different functions.  For example all the following functions have 'sub
$0x1,%esp':

  match_wildcard()
  pci_vpd_find_tag()
  strspn()

sub $0x2,%esp:

  rgb_foreground()
  scsi_extd_sense_format()

sub $0x5,%esp:

  iot2040_rs485_config()

sub $0x6,%esp:

  x86_match_cpu()
  clear_buffer_attributes()

The only thing I can see they have in common is that they're leaf
functions.  In all cases the stack pointer is otherwise unused.

The problem seemed to go away when I built the same kernel with GCC 5.3.

FYI, here's the full function (4.14-rc3 compiled with RHEL GCC 4.8.3-9).
Config is attached.

c124a388 <acpi_rs_move_data>:
c124a388:       55                      push   %ebp
c124a389:       89 e5                   mov    %esp,%ebp
c124a38b:       57                      push   %edi
c124a38c:       56                      push   %esi
c124a38d:       89 d6                   mov    %edx,%esi
c124a38f:       53                      push   %ebx
c124a390:       31 db                   xor    %ebx,%ebx
c124a392:       83 ec 03                sub    $0x3,%esp
c124a395:       8a 55 08                mov    0x8(%ebp),%dl
c124a398:       66 89 4d f2             mov    %cx,-0xe(%ebp)
c124a39c:       83 ea 15                sub    $0x15,%edx
c124a39f:       88 55 f1                mov    %dl,-0xf(%ebp)
c124a3a2:       0f b6 fa                movzbl %dl,%edi
c124a3a5:       0f b7 4d f2             movzwl -0xe(%ebp),%ecx
c124a3a9:       39 cb                   cmp    %ecx,%ebx
c124a3ab:       73 36                   jae    c124a3e3 <acpi_rs_move_data+=
0x5b>
c124a3ad:       80 7d f1 07             cmpb   $0x7,-0xf(%ebp)
c124a3b1:       77 30                   ja     c124a3e3 <acpi_rs_move_data+=
0x5b>
c124a3b3:       ff 24 bd cc e9 36 c1    jmp    *-0x3ec91634(,%edi,4)
                        c124a3b6: R_386_32      .rodata
c124a3ba:       89 c7                   mov    %eax,%edi
c124a3bc:       f3 a4                   rep movsb %ds:(%esi),%es:(%edi)
c124a3be:       eb 23                   jmp    c124a3e3 <acpi_rs_move_data+=
0x5b>
c124a3c0:       66 8b 0c 5e             mov    (%esi,%ebx,2),%cx
c124a3c4:       66 89 0c 58             mov    %cx,(%eax,%ebx,2)
c124a3c8:       eb 16                   jmp    c124a3e0 <acpi_rs_move_data+=
0x58>
c124a3ca:       8b 0c 9e                mov    (%esi,%ebx,4),%ecx
c124a3cd:       89 0c 98                mov    %ecx,(%eax,%ebx,4)
c124a3d0:       eb 0e                   jmp    c124a3e0 <acpi_rs_move_data+=
0x58>
c124a3d2:       8b 14 de                mov    (%esi,%ebx,8),%edx
c124a3d5:       8b 4c de 04             mov    0x4(%esi,%ebx,8),%ecx
c124a3d9:       89 14 d8                mov    %edx,(%eax,%ebx,8)
c124a3dc:       89 4c d8 04             mov    %ecx,0x4(%eax,%ebx,8)
c124a3e0:       43                      inc    %ebx
c124a3e1:       eb c2                   jmp    c124a3a5 <acpi_rs_move_data+=
0x1d>
c124a3e3:       83 c4 03                add    $0x3,%esp
c124a3e6:       5b                      pop    %ebx
c124a3e7:       5e                      pop    %esi
c124a3e8:       5f                      pop    %edi
c124a3e9:       5d                      pop    %ebp
c124a3ea:       c3                      ret

--===============2035686828826770295==
Content-Type: application/x-gunzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
AA==
--===============2035686828826770295==--

