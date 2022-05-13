Content-Type: multipart/mixed; boundary="===============7830170369553209372=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: lkp@lists.01.org
Subject: Re: [x86/uaccess] 9c5743dff4: WARNING:at_arch/x86/mm/extable.c:#ex_handler_fprestore
Date: Fri, 13 May 2022 19:12:38 +0200
Message-ID: <Yn6Rhv+VhZlVpOjt@zn.tnic>
In-Reply-To: <CAHk-=wjDE7tWc5k81P41AKw9b13ehrTX8XawgnP-wa6fA57kuA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7830170369553209372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2022 at 09:52:08AM -0700, Linus Torvalds wrote:
> On Fri, May 13, 2022 at 1:55 AM kernel test robot <oliver.sang@intel.co=
m> wrote:
> >
> > FYI, we noticed the following commit (built with gcc-11): commit
> > 9c5743dff415 ("x86/uaccess: fix code generation in put_user()")
> > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Err, is this seriously a report for a 5.9-something kernel?

[  266.828722][    T1] CPU: 0 PID: 1 Comm: init Not tainted 5.9.0-13419-g9c=
5743dff415 #1

> >
> > in testcase: boot
> >
> > on test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2=
 -m 16G
> >
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):

Can you reproduce the same with the latest Linus master or tip/master or
something current...?

Thx.

-- =

Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
--===============7830170369553209372==--

