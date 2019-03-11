Content-Type: multipart/mixed; boundary="===============6554128201430881982=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [selftests/vm] a05ef00c97: kernel_selftests.vm.vmalloc_stability_smoke_test.fail
Date: Mon, 11 Mar 2019 14:56:13 -0700
Message-ID: <20190311145613.af4e4ed3adf0718a0a7f3b71@linux-foundation.org>
In-Reply-To: <CAHk-=wj2TzOJqCr0-J5H6w=d5DgAtVQBQNrYHzaTMkEwkZrwnA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6554128201430881982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Mar 2019 10:20:06 -0700 Linus Torvalds <torvalds@linux-foundat=
ion.org> wrote:

> On Mon, Mar 11, 2019 at 12:43 AM kernel test robot
> <rong.a.chen@intel.com> wrote:
> >
> > ./run_vmtests: line 217: ./test_vmalloc.sh: Permission denied
> =

> I marked that script executable:
> =

>   6bc3fe8e7e17 ("tools: mark 'test_vmalloc.sh' executable")
> =

> although perhaps the better fix would have been to explicitly use the
> shell to start it in the 'run_vmtests' script instead?
> =

> We have a lot of files that aren't marked executable, probably because
> they came in as (or were generated as) non-git patches. Often through
> Andrew's workflow.

Not only that.  patch(1) doesn't set the x bit.  So if someone
downloads and applies patch-5.0-rc1.xz (as we say to do in the
documentation), their kernel won't work correctly.

This happens fairly regularly and the fix is to replace

	test_vmalloc.sh ...

with

	/bin/sh test_vmalloc.sh ...



--===============6554128201430881982==--

