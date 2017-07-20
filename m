Content-Type: multipart/mixed; boundary="===============3522322669890121836=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [include/linux/string.h] 6974f0c455: kernel_BUG_at_lib/string.c
Date: Fri, 21 Jul 2017 00:51:40 +0900
Message-ID: <20170721005140.ebf6d119bb30cc6cfe12ae61@kernel.org>
In-Reply-To: <CA+55aFwuebKQ0-sAiRJWpMcaVJ8MjXvCg56DO5q8jMiPDXvc8A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3522322669890121836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 19 Jul 2017 21:04:25 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> Hmm. I wonder why the kernel test robot ends up having that annoying
> line doubling for the dmesg.
> =

> On Wed, Jul 19, 2017 at 6:42 PM, kernel test robot
> <xiaolong.ye@intel.com> wrote:
> >
> > FYI, we noticed the following commit:
> >
> > commit: 6974f0c4555e285ab217cee58b6e874f776ff409 ("include/linux/string=
.h: add the option of fortified string.h functions")
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> =

> It does strike me that the fortify_panic() code once again makes life
> unnecessarily hard for everybody by using "BUG()"
> =

> What the hell is wrong with people? I feel; like I have to say this
> multiple times for every single merge window, and sometimes in
> between.
> =

> BUG() and BUG_ON() are not acceptable debugging things. They kill the
> machine. They make for bad debugging.
> =

> > [    8.134860] kernel BUG at lib/string.c:985!
> =

> This is basically an entirely useless piece of completely
> information-less garbage.
> =

> It would have been much nicer if all the fortify_panic() calls had
> instead used WARN_ONCE() with helpful pointers to what is going on.
> =

> As it is, the full dmesg does show that
> =

>     detected buffer overflow in memcpy
> =

> but since it was printed out separately, if comes before the "-- cut
> here --" part and didn't get reported in the summary.
> =

> > [    8.134886]  arch_prepare_optimized_kprobe+0xd5/0x171
> =

> It's apparently this:
> =

>         /* Copy arch-dep-instance from template */
>         memcpy(buf, &optprobe_template_entry, TMPL_END_IDX);
> =

> and looking at the code generation, the conditional in the fortify case is
> =

> # ./include/linux/string.h:307:         if (p_size < size || q_size < siz=
e)
>         cmpq    $1, %r13        #, _14
>         jbe     .L109   #,
> =

> but it's hard to tell whether that is p_size or q_size. One of them
> must be ~0ul (or maybe both are 1) for it to have simplified to that
> single conditional.
> =

> So the fortify_string code has decided that only a single-byte (or
> empty) memcpy is ok.
> =

> And that, in turn, seems to be because we're copying from
> optprobe_template_entry, which is declared as
> =

>     extern __visible kprobe_opcode_t optprobe_template_entry;
> =

> so the fortify code decides it's a single character.
> =

> Does just changing all those things to be declared as arrays fix things?
> =


BTW, I've confirmed this works.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Tested-by: Masami Hiramatsu <mhiramat@kernel.org>

Thank you!

> IOW, a patch something like this white-space damaged mess:
> =

>     diff --git a/arch/x86/include/asm/kprobes.h b/arch/x86/include/asm/kp=
robes.h
>     index 34b984c60790..6cf65437b5e5 100644
>     --- a/arch/x86/include/asm/kprobes.h
>     +++ b/arch/x86/include/asm/kprobes.h
>     @@ -52,10 +52,10 @@ typedef u8 kprobe_opcode_t;
>      #define flush_insn_slot(p) do { } while (0)
> =

>      /* optinsn template addresses */
>     -extern __visible kprobe_opcode_t optprobe_template_entry;
>     -extern __visible kprobe_opcode_t optprobe_template_val;
>     -extern __visible kprobe_opcode_t optprobe_template_call;
>     -extern __visible kprobe_opcode_t optprobe_template_end;
>     +extern __visible kprobe_opcode_t optprobe_template_entry[];
>     +extern __visible kprobe_opcode_t optprobe_template_val[];
>     +extern __visible kprobe_opcode_t optprobe_template_call[];
>     +extern __visible kprobe_opcode_t optprobe_template_end[];
>      #define MAX_OPTIMIZED_LENGTH (MAX_INSN_SIZE + RELATIVE_ADDR_SIZE)
>      #define MAX_OPTINSN_SIZE                           \
>         (((unsigned long)&optprobe_template_end -       \
> =

> Hmm?
> =

>                  Linus


-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============3522322669890121836==--

