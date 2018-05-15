Content-Type: multipart/mixed; boundary="===============4825477924949969485=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Tue, 15 May 2018 17:22:11 -0500
Message-ID: <20180515222211.ods5hzne46hozojq@treble>
In-Reply-To: <20180515214337.GA18021@avx2>
List-Id: <oe-lkp.lists.linux.dev>

--===============4825477924949969485==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 16, 2018 at 12:43:37AM +0300, Alexey Dobriyan wrote:
> On Tue, May 15, 2018 at 09:25:53PM +0000, Anvin, H Peter wrote:
> > Why is that a problem?
> > Code: 00 00 00 eb e6 cc cc cc cc cc cc cc cc cc cc cc cc cc fa 8d b6 00=
 00 00 00 e8 5d e8 8f ff 8b 44 24 34 83 e0 03 83 f8 03 72 28 cc &lt;cc&gt; =
cc cc cc cc cc cc fa 8d b6 00 00 00 00 e8 3d e8 8f ff 89 e0
> > =

> > EIP: ret_from_intr+0xd/0x14 SS:ESP: 0068:8603bfb4
> > =

> > INT3 slipped through M586 =3D&gt; X86_ALIGNMENT_16 :-\
> =

> I could make the patch x86_64 only, but!
> =

> It crashed into the middle of the padding.
> =

> 796ef8fc <ret_from_intr>:
> 796ef8fc:       8b 44 24 34             mov    eax,DWORD PTR [esp+0x34]
> 796ef900:       83 e0 03                and    eax,0x3
> 796ef903:       83 f8 03                cmp    eax,0x3
> 796ef906:       72 28                   jb     796ef930 <resume_kernel>
> 796ef908:       cc                      int3
> 796ef909:       cc       <=3D=3D=3D=3D=3D=3D=3D=3D>     int3
> 796ef90a:       cc                      int3
> 796ef90b:       cc                      int3
> 796ef90c:       cc                      int3
> 796ef90d:       cc                      int3
> 796ef90e:       cc                      int3
> 796ef90f:       cc                      int3

The padding isn't needed there, and the resume_userspace symbol is never
used, so wouldn't this fix it?


diff --git a/arch/x86/entry/entry_32.S b/arch/x86/entry/entry_32.S
index bef8e2b202a8..9e56243c984c 100644
--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -338,7 +338,6 @@ ret_from_intr:
 	cmpl	$USER_RPL, %eax
 	jb	resume_kernel			# not returning to v8086 or userspace
 =

-ENTRY(resume_userspace)
 	DISABLE_INTERRUPTS(CLBR_ANY)
 	TRACE_IRQS_OFF
 	movl	%esp, %eax

--===============4825477924949969485==--

