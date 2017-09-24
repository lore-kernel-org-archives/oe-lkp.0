Content-Type: multipart/mixed; boundary="===============2636713769387879927=="
MIME-Version: 1.0
From: Ingo Molnar <mingo@kernel.org>
To: lkp@lists.01.org
Subject: Re: 9f4835fb96 ("x86/fpu: Tighten validation of user-supplied .."): Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
Date: Sun, 24 Sep 2017 13:11:17 +0200
Message-ID: <20170924111117.7nftqa2g5lnzn7xr@gmail.com>
In-Reply-To: <59c6e23f.nOk6ceVoId2JVMIx%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2636713769387879927==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


* kernel test robot <fengguang.wu@intel.com> wrote:

> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git WIP.x86/fpu
> =

> commit 9f4835fb965d8eea7e608d0cb62c246c804dec90
> Author:     Eric Biggers <ebiggers@google.com>
> AuthorDate: Fri Sep 22 10:41:55 2017 -0700
> Commit:     Ingo Molnar <mingo@kernel.org>
> CommitDate: Sat Sep 23 11:02:00 2017 +0200
> =

>     x86/fpu: Tighten validation of user-supplied xstate_header

Would it be possible to re-start this bisection, now that I've split up the=
 commit =

into 10 more obvious patches?

My guess is that it's one of these two that is the bad commit:

  3deb4cca945b: x86/fpu: Copy the full header in copy_user_to_xstate()
  cfbd048cce44: x86/fpu: Copy the full state_header in copy_kernel_to_xstat=
e()

... but it could be some of the others as well.

Thanks,

	Ingo

--===============2636713769387879927==--

