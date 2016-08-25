Content-Type: multipart/mixed; boundary="===============3137908167091463612=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/hweight] 65ea11ec6a: will-it-scale.per_process_ops 9.3% improvement
Date: Thu, 25 Aug 2016 11:22:14 +0200
Message-ID: <20160825092214.GA4643@nazgul.tnic>
In-Reply-To: <20160818041139.GA22101@nazgul.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============3137908167091463612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 06:11:39AM +0200, Borislav Petkov wrote:
> So if there's no bug, alternatives should replace all "call
> __sw_hweightXX" calls with POPCNT. So you shouldn't be even calling
> these functions and hitting that path.
> =

> Can you boot the kernel with "debug-alternative" and put that dmesg
> somewhere along with vmlinux for me to stare at? Privately is fine too.
> =

> I'd like to make sure the alternatives application actually happens.

Ok, Huang sent me the files I asked for privately (Thanks!). And I still ca=
n't
see how that commit can even influence anything as the code doesn't get
executed after alternatives:

ffffffff81007f35:       e8 36 66 47 00          callq  ffffffff8147e570 <__=
sw_hweight64>
ffffffff81007f35: final_insn: f3 48 0f b8 c7 (popcnt %rdi,%rax)

ffffffff81008021:       e8 4a 65 47 00          callq  ffffffff8147e570 <__=
sw_hweight64>
ffffffff81008021: final_insn: f3 48 0f b8 c7 (popcnt %rdi,%rax)

ffffffff8100bd63:       e8 08 28 47 00          callq  ffffffff8147e570 <__=
sw_hweight64>
ffffffff8100bd63: final_insn: f3 48 0f b8 c7 (popcnt %rdi,%rax)

ffffffff81171a05:       e8 66 cb 30 00          callq  ffffffff8147e570 <__=
sw_hweight64>
ffffffff81171a05: final_insn: f3 48 0f b8 c7 (popcnt %rdi,%rax)

ffffffff81171a66:       e8 05 cb 30 00          callq  ffffffff8147e570 <__=
sw_hweight64>
ffffffff81171a66: final_insn: f3 48 0f b8 c7 (popcnt %rdi,%rax)

ffffffff8145c3e5:       e8 86 21 02 00          callq  ffffffff8147e570 <__=
sw_hweight64>
ffffffff8145c3e5: final_insn: f3 48 0f b8 c7 (popcnt %rdi,%rax)

ffffffff8145c40c:       e8 5f 21 02 00          callq  ffffffff8147e570 <__=
sw_hweight64>
ffffffff8145c40c: final_insn: f3 48 0f b8 c7 (popcnt %rdi,%rax)

ffffffff8174768d:       e8 de 6e d3 ff          callq  ffffffff8147e570 <__=
sw_hweight64>
ffffffff8174768d: final_insn: f3 48 0f b8 c7 (popcnt %rdi,%rax)

ffffffff817c43da:       e8 91 a1 cb ff          callq  ffffffff8147e570 <__=
sw_hweight64>
ffffffff817c43da: final_insn: f3 48 0f b8 c7 (popcnt %rdi,%rax)

ffffffff817f4e6a:       e8 01 97 c8 ff          callq  ffffffff8147e570 <__=
sw_hweight64>
ffffffff817f4e6a: final_insn: f3 48 0f b8 c7 (popcnt %rdi,%rax)

ffffffff81ffae4b:       e8 20 37 48 ff          callq  ffffffff8147e570 <__=
sw_hweight64>
ffffffff81ffae4b: final_insn: f3 48 0f b8 c7 (popcnt %rdi,%rax)

ffffffff82011bd1:       e8 9a c9 46 ff          callq  ffffffff8147e570 <__=
sw_hweight64>
ffffffff82011bd1: final_insn: f3 48 0f b8 c7 (popcnt %rdi,%rax)

__sw_hweight64 is at 0xffffffff8147e570 and all those locations which
call 0xffffffff8147e570 get replaced with POPCNT (final_insn in dmesg).

Also, I did this to a guest kernel:

---
diff --git a/arch/x86/lib/hweight.S b/arch/x86/lib/hweight.S
index 8a602a1e404a..7f18f59eadd5 100644
--- a/arch/x86/lib/hweight.S
+++ b/arch/x86/lib/hweight.S
@@ -34,6 +34,7 @@ ENTRY(__sw_hweight32)
 ENDPROC(__sw_hweight32)
 =

 ENTRY(__sw_hweight64)
+	call dump_stack
 #ifdef CONFIG_X86_64
 	pushq   %rdi
 	pushq   %rdx
---

and got 23 invocations before alternatives get applied:

$ grep dump_stack ~/kvm/test-x86_64-1235.log | uniq -c
     23 [<ffffffff81336955>] dump_stack+0x67/0x92

just to make sure that __sw_hweight64 *actually* *really* gets replaced.

Then I ran the job.yaml thing as suggested in the initial mail and no
more __sw_hweight64 calls.

So either I'm still missing something or that's the wrong commit or ...

/me haz no idea :-\

-- =

Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.

SUSE Linux GmbH, GF: Felix Imend=C3=B6rffer, Jane Smithard, Graham Norton, =
HRB 21284 (AG N=C3=BCrnberg)
--

--===============3137908167091463612==--

