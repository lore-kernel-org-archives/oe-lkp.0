Content-Type: multipart/mixed; boundary="===============6017437001129392256=="
MIME-Version: 1.0
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: lkp@lists.01.org
Subject: Re: [x86/ftrace] 644e0e8dc7:
Date: Thu, 20 Apr 2017 08:28:22 -0500
Message-ID: <20170420132822.l5lcr42ij7u4hngc@treble>
In-Reply-To: <20170415195602.54f9d410@gandalf.local.home>
List-Id: <oe-lkp.lists.linux.dev>

--===============6017437001129392256==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 15, 2017 at 07:56:02PM -0400, Steven Rostedt wrote:
> On Sun, 16 Apr 2017 06:44:57 +0800
> kernel test robot <fengguang.wu@intel.com> wrote:
> =

> > Greetings,
> > =

> > 0day kernel testing robot got the below dmesg and the first bad commit =
is
> > =

> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git mas=
ter
> =

> Hi Fengguang,
> =

> What's the issues here? There's a lot of data and I don't see any
> panics. Is the problem this?
> =

> [    1.432465] Kprobe smoke test: started
> [    1.463294] WARNING: kernel stack frame pointer at cf493efc in swapper=
/0:1 has bad value 00200246
> [    1.463297] unwind stack type:0 next_sp:  (null) mask:2 graph_idx:0
> [    1.463299] cf493d18: 00000000cf490040 (0xcf490040)
> [    1.463300] cf493d1c: 00000000cf493d5c (0xcf493d5c)
> [    1.463304] cf493d20: 00000000c101318f (__save_stack_trace+0x9a/0xa4)
> [    1.463306] cf493d24: 0000000000490040 (0x490040)
> [    1.463307] cf493d28: 0000000000000000 ...
> [    1.463308] cf493d2c: 00000000cf492000 (0xcf492000)
> [    1.463309] cf493d30: 00000000cf494000 (0xcf494000)
> [    1.463310] cf493d34: 0000000000000000 ...
> =

> Which would make sense as kprobes may use ftrace if a probe is set at
> the same location as a ftrace nop. And the -mfentry moves the place
> where the ftrace nop is to the start of a function.
> =

> That is, this bug may have always been there, but without -mfentry, the
> ftrace nop is not at the start of the function, which means kprobe
> smoke tests probably would never land on one. But now that -mfentry is
> implemented, it's much more likely.
> =

> I'll still look deeper into this. But I also Cc'd Masami.

This seems to be a real bug, unlike some of the other unwinder warnings.
The following line in ftrace_32.S makes ebp point to regs->flags:

#ifdef CC_USING_FENTRY
	/* Load 4 off of the parent ip addr into ebp */
	lea	14*4(%esp), %ebp
#endif

-- =

Josh

--===============6017437001129392256==--

