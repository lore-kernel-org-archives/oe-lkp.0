Content-Type: multipart/mixed; boundary="===============1966716697829358781=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [include/linux/string.h] 6974f0c455: kernel_BUG_at_lib/string.c
Date: Tue, 25 Jul 2017 16:35:43 -0700
Message-ID: <CAGXu5jKxBsJGQHx4Wx24iOBZy5raf0s0iDJ2J+EQOGTrVx9-nw@mail.gmail.com>
In-Reply-To: <CA+55aFwuebKQ0-sAiRJWpMcaVJ8MjXvCg56DO5q8jMiPDXvc8A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1966716697829358781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

(Finally getting back around to this thread, sorry for the delay...)

On Wed, Jul 19, 2017 at 9:04 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> As it is, the full dmesg does show that
>
>     detected buffer overflow in memcpy
>
> but since it was printed out separately, if comes before the "-- cut
> here --" part and didn't get reported in the summary.

Replying to this first: this is actually a long-standing problem, and
this reporting actually matches how WARNs appear. All the text from
WARN ends up above the --cut-- line too, which is frustrating to say
the least. For example, here's the kind of thing I saw while testing
refcount overflows earlier today:

[   11.971447] refcount_t: saturated; leaking memory.
[   11.972362] ------------[ cut here ]------------
[   11.973222] WARNING: CPU: 3 PID: 2181 at lib/refcount.c:132
refcount_inc_not_zero+0x48/0x60

Which is from:

        WARN_ONCE(new =3D=3D UINT_MAX, "refcount_t: saturated; leaking memo=
ry.\n");

Following include/asm-generic/bug.h, it's because WARN(1, "eek\n") becomes:

        printk("eek\n"); __WARN();

Which, IIUC, is mostly because WARN (and BUG) is handled as a trap. We
don't plumb the printk into a deeper level (or rather, we don't raise
the --cut-- line to the top).

The "cut here" comes from lib/bug.c's report_bug and gets duplicated
for the WARN path in kernel/panic.c's __warn():

enum bug_trap_type report_bug(unsigned long bugaddr, struct pt_regs *regs)
...
        if (warning) {
                /* this is a WARN_ON rather than BUG/BUG_ON */
                __warn(file, line, (void *)bugaddr, BUG_GET_TAINT(bug), reg=
s,
                       NULL);
                return BUG_TRAP_TYPE_WARN;
        }

        printk(KERN_DEFAULT "------------[ cut here ]------------\n");
...

void __warn(const char *file, int line, void *caller, unsigned taint,
            struct pt_regs *regs, struct warn_args *args)
{
        disable_trace_on_warning();

        pr_warn("------------[ cut here ]------------\n");
...

BUG doesn't even have a way to report text, and the warn paths don't
know if it came through WARN_ON (without text) or WARN (with text).
I've never been able to see a sensible way out of this. BUG entirely
lacks text, and WARN puts it in the wrong place. >_<

And, as an aside, I notice that the internal printk in WARN doesn't
include a KERN_WARN by default, and I think I remember having this
discussion a while back, where I see nearly everything doesn't set it,
but some do:

$ git grep -E 'WARN(_ON)?(_RATELIMIT)?(_ONCE)?\(' | grep -v KERN | wc -l
14465
$ git grep -E 'WARN(_ON)?(_RATELIMIT)?(_ONCE)?\(' | grep KERN | wc -l
87

> It would have been much nicer if all the fortify_panic() calls had
> instead used WARN_ONCE() with helpful pointers to what is going on.

In this case, there isn't a sensible way to continue. For other
things, like refcount hardening, we can WARN and then saturate the
refcount and continue running, fully avoiding the vulnerable condition
(use-after-free). Here, we're dealing with a runtime check that knows
the buffer size and we've been handed something that has turned out to
be too large, but it's too late (e.g. memcpy, strcpy, etc don't have a
way to return an error). If this was switched to a WARN, we'd be in a
situation where we can't truncate, skip the copy, or any other partial
action, as those each might lead to some other bad situation.

All that said, looking through the fortified functions again, it is
arguable that we could let kmemdup, memscan, memchr, and memchr_inv
each return NULL and WARN. I'm nervous about the scan/chr functions
being switched to "didn't find it" if that leads to logic errors,
though. Having kmemdup fail should already be a well-handled error
path...

-Kees

-- =

Kees Cook
Pixel Security

--===============1966716697829358781==--

