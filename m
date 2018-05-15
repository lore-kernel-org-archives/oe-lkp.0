Content-Type: multipart/mixed; boundary="===============2907475340378551163=="
MIME-Version: 1.0
From: Thomas Gleixner <tglx@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/asm] 51bad67ffb: int3:#[##]
Date: Wed, 16 May 2018 00:25:46 +0200
Message-ID: <alpine.DEB.2.21.1805160009230.1605@nanos.tec.linutronix.de>
In-Reply-To: <20180515214337.GA18021@avx2>
List-Id: <oe-lkp.lists.linux.dev>

--===============2907475340378551163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 16 May 2018, Alexey Dobriyan wrote:

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

EIP points to the second int3 because that's where a simple return would
return to. do_trap() does not handle int3 special.

>From a quick check that seems to be the only code sequence which has:

     jcc     lbl

ENTRY(foo)

and ENTRY() aligns to a 16 byte boundary. So the simple fix for that is
below. We need objtool support to detect such places ...

Thanks,

	tglx

8<-------------------

--- a/arch/x86/entry/entry_32.S
+++ b/arch/x86/entry/entry_32.S
@@ -338,6 +338,11 @@ END(ret_from_fork)
 	cmpl	$USER_RPL, %eax
 	jb	resume_kernel			# not returning to v8086 or userspace
 =

+	/*
+	 * Jump over the alignment padding which is filled with int3 instructions
+	 */
+	jmp	resume_userspace
+
 ENTRY(resume_userspace)
 	DISABLE_INTERRUPTS(CLBR_ANY)
 	TRACE_IRQS_OFF


--===============2907475340378551163==--

