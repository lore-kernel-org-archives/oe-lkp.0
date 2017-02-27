Content-Type: multipart/mixed; boundary="===============8010534298284094560=="
MIME-Version: 1.0
From: Masami Hiramatsu <mhiramat@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [x86/mm/ptdump] 243b72aae2: WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page
Date: Tue, 28 Feb 2017 01:11:40 +0900
Message-ID: <20170228011140.ef61008afb57976a74ead279@kernel.org>
In-Reply-To: <34aa4f8e-190a-8895-bf43-22d3f08efd17@virtuozzo.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8010534298284094560==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Feb 2017 16:01:34 +0300
Andrey Ryabinin <aryabinin@virtuozzo.com> wrote:

> On 02/27/2017 04:03 AM, kernel test robot wrote:
> > =

> > FYI, we noticed the following commit:
> > =

> > commit: 243b72aae28ca1032284028323bb81c9235b15c9 ("x86/mm/ptdump: Optim=
ize check for W+X mappings for CONFIG_KASAN=3Dy")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> ...
> > =

> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> > =

> > =

> > +-----------------------------------------------------+------------+---=
---------+
> > |                                                     | 5b1ad68f9b | 24=
3b72aae2 |
> > +-----------------------------------------------------+------------+---=
---------+
> > | boot_successes                                      | 0          | 0 =
         |
> > | boot_failures                                       | 8          | 6 =
         |
> > | BUG:KASAN:slab-out-of-bounds                        | 8          | 6 =
         |
> > | WARNING:at_arch/x86/mm/dump_pagetables.c:#note_page | 0          | 6 =
         |
> > +-----------------------------------------------------+------------+---=
---------+
> =

> Ok, I reproduced this, but it's definitely caused *not* by 243b72aae28.
> This WARN is also reproducible on the parent commit 5b1ad68f9b.
> The only difference here is that on parent one needs dozens of seconds to=
 reach this WARNING.
> It seems that this time difference somehow confused the robot.
> =

> As for the warning itself, it caused by kprobes. krpobe code use module_a=
lloc() which
> creates these RWX mappings.
> I'm not sure how to fix this as AFAIK kprobes actually need RWX mapping.

Thanks! I also noticed this issue. I actually have a plan to make kprobes w=
ith R+X mappings (as ftrace does).
I'll queue this on my TODO list.



-- =

Masami Hiramatsu <mhiramat@kernel.org>

--===============8010534298284094560==--

