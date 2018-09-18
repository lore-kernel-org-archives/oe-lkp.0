Content-Type: multipart/mixed; boundary="===============7013346373906070343=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [linux] c208f0c9ab: general_protection_fault:#[##]
Date: Tue, 18 Sep 2018 16:00:19 +0800
Message-ID: <63a61582-8472-3564-3009-a218f9597ce7@intel.com>
In-Reply-To: <6483.1537250897@warthog.procyon.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============7013346373906070343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 09/18/2018 02:08 PM, David Howells wrote:
> Rong Chen <rong.a.chen@intel.com> wrote:
>
>>>>> [   50.838927] RIP: 0010:mqueue_get_tree+0x2c/0xb0
>>> Could you get me a disassembly of mqueue_get_tree()?
>> $ faddr2line ./vmlinux mqueue_get_tree+0x2c
>> mqueue_get_tree+0x2c/0xa3:
>> mqueue_get_tree at ipc/mqueue.c:362
> Yes, I know.  Could you get me a disassembly of that function?  When I bu=
ild
> it using your instructions, I don't see an instruction at 0x2c.
>
Is it this one?

(gdb) disassemble mqueue_get_tree
Dump of assembler code for function mqueue_get_tree:
 =C2=A0=C2=A0 0xffffffff813dccf0 <+0>:=C2=A0=C2=A0=C2=A0=C2=A0 callq=C2=A0 =
0xffffffff81c017a0 <__fentry__>
 =C2=A0=C2=A0 0xffffffff813dccf5 <+5>:=C2=A0=C2=A0=C2=A0=C2=A0 push=C2=A0=
=C2=A0 %r12
 =C2=A0=C2=A0 0xffffffff813dccf7 <+7>:=C2=A0=C2=A0=C2=A0=C2=A0 push=C2=A0=
=C2=A0 %rbp
 =C2=A0=C2=A0 0xffffffff813dccf8 <+8>:=C2=A0=C2=A0=C2=A0=C2=A0 push=C2=A0=
=C2=A0 %rbx
 =C2=A0=C2=A0 0xffffffff813dccf9 <+9>:=C2=A0=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=
=A0=C2=A0 0x30(%rdi),%r12
 =C2=A0=C2=A0 0xffffffff813dccfd <+13>:=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 %rdi,%rbx
 =C2=A0=C2=A0 0xffffffff813dcd00 <+16>:=C2=A0=C2=A0=C2=A0 mov $0xffffffff83=
0f7520,%rdi
 =C2=A0=C2=A0 0xffffffff813dcd07 <+23>:=C2=A0=C2=A0=C2=A0 callq=C2=A0 0xfff=
fffff81a18b00 <_raw_spin_lock>
 =C2=A0=C2=A0 0xffffffff813dcd0c <+28>:=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 (%r12),%rax
 =C2=A0=C2=A0 0xffffffff813dcd10 <+32>:=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 0x2f0(%rax),%rax
 =C2=A0=C2=A0 0xffffffff813dcd17 <+39>:=C2=A0=C2=A0=C2=A0 test=C2=A0=C2=A0 =
%rax,%rax
 =C2=A0=C2=A0 0xffffffff813dcd1a <+42>:=C2=A0=C2=A0=C2=A0 je=C2=A0=C2=A0=C2=
=A0=C2=A0 0xffffffff813dcd41 =

<mqueue_get_tree+81>
 =C2=A0=C2=A0 0xffffffff813dcd1c <+44>:=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 0x8(%rax),%rax
 =C2=A0=C2=A0 0xffffffff813dcd20 <+48>:=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 0x68(%rax),%rbp
 =C2=A0=C2=A0 0xffffffff813dcd24 <+52>:=C2=A0=C2=A0=C2=A0 test=C2=A0=C2=A0 =
%rbp,%rbp
 =C2=A0=C2=A0 0xffffffff813dcd27 <+55>:=C2=A0=C2=A0=C2=A0 je=C2=A0=C2=A0=C2=
=A0=C2=A0 0xffffffff813dcd32 =

<mqueue_get_tree+66>
 =C2=A0=C2=A0 0xffffffff813dcd29 <+57>:=C2=A0=C2=A0=C2=A0 lea=C2=A0=C2=A0=
=C2=A0 0x58(%rbp),%rdi
 =C2=A0=C2=A0 0xffffffff813dcd2d <+61>:=C2=A0=C2=A0=C2=A0 callq=C2=A0 0xfff=
fffff81493c40 <lockref_get>
 =C2=A0=C2=A0 0xffffffff813dcd32 <+66>:=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 %rbp,0x38(%rbx)
 =C2=A0=C2=A0 0xffffffff813dcd36 <+70>:=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 0x68(%rbp),%rax
 =C2=A0=C2=A0 0xffffffff813dcd3a <+74>:=C2=A0=C2=A0=C2=A0 lock incl 0x9c(%r=
ax)
 =C2=A0=C2=A0 0xffffffff813dcd41 <+81>:=C2=A0=C2=A0=C2=A0 mov $0xffffffff83=
0f7520,%rdi
 =C2=A0=C2=A0 0xffffffff813dcd48 <+88>:=C2=A0=C2=A0=C2=A0 callq=C2=A0 *0xff=
ffffff8263ae48
 =C2=A0=C2=A0 0xffffffff813dcd4f <+95>:=C2=A0=C2=A0=C2=A0 mov=C2=A0=C2=A0=
=C2=A0 0x38(%rbx),%rax
 =C2=A0=C2=A0 0xffffffff813dcd53 <+99>:=C2=A0=C2=A0=C2=A0 decl %gs:0x7ec38e=
36(%rip)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =

0x15b90 <__preempt_count>
 =C2=A0=C2=A0 0xffffffff813dcd5a <+106>:=C2=A0=C2=A0 test=C2=A0=C2=A0 %rax,=
%rax
 =C2=A0=C2=A0 0xffffffff813dcd5d <+109>:=C2=A0=C2=A0 je=C2=A0=C2=A0=C2=A0=
=C2=A0 0xffffffff813dcd73 =

<mqueue_get_tree+131>
 =C2=A0=C2=A0 0xffffffff813dcd5f <+111>:=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 =
0x68(%rax),%rdi
 =C2=A0=C2=A0 0xffffffff813dcd63 <+115>:=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0 =
$0x70,%rdi
 =C2=A0=C2=A0 0xffffffff813dcd67 <+119>:=C2=A0=C2=A0 callq=C2=A0 0xffffffff=
81a15720 <down_write>
 =C2=A0=C2=A0 0xffffffff813dcd6c <+124>:=C2=A0=C2=A0 xor=C2=A0=C2=A0=C2=A0 =
%eax,%eax
 =C2=A0=C2=A0 0xffffffff813dcd6e <+126>:=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 =
%rbx
 =C2=A0=C2=A0 0xffffffff813dcd6f <+127>:=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 =
%rbp
 =C2=A0=C2=A0 0xffffffff813dcd70 <+128>:=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 =
%r12
 =C2=A0=C2=A0 0xffffffff813dcd72 <+130>:=C2=A0=C2=A0 retq
 =C2=A0=C2=A0 0xffffffff813dcd73 <+131>:=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 =
(%r12),%rax
 =C2=A0=C2=A0 0xffffffff813dcd77 <+135>:=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 =
%rbx,%rdi
 =C2=A0=C2=A0 0xffffffff813dcd7a <+138>:=C2=A0=C2=A0 mov $0xffffffff813dc19=
0,%rdx
 =C2=A0=C2=A0 0xffffffff813dcd81 <+145>:=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 =
$0x1,%esi
 =C2=A0=C2=A0 0xffffffff813dcd86 <+150>:=C2=A0=C2=A0 mov=C2=A0=C2=A0=C2=A0 =
%rax,0x78(%rbx)
 =C2=A0=C2=A0 0xffffffff813dcd8a <+154>:=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 =
%rbx
 =C2=A0=C2=A0 0xffffffff813dcd8b <+155>:=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 =
%rbp
 =C2=A0=C2=A0 0xffffffff813dcd8c <+156>:=C2=A0=C2=A0 pop=C2=A0=C2=A0=C2=A0 =
%r12
 =C2=A0=C2=A0 0xffffffff813dcd8e <+158>:=C2=A0=C2=A0 jmpq=C2=A0=C2=A0 0xfff=
fffff81288d50 <vfs_get_super>
End of assembler dump.

Best Regards,
Rong Chen

--===============7013346373906070343==--

