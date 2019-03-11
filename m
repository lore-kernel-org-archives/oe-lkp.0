Content-Type: multipart/mixed; boundary="===============2567553182696213126=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [selftests/vm] a05ef00c97: kernel_selftests.vm.vmalloc_stability_smoke_test.fail
Date: Mon, 11 Mar 2019 10:20:06 -0700
Message-ID: <CAHk-=wj2TzOJqCr0-J5H6w=d5DgAtVQBQNrYHzaTMkEwkZrwnA@mail.gmail.com>
In-Reply-To: <20190311074315.GD10839@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2567553182696213126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 11, 2019 at 12:43 AM kernel test robot
<rong.a.chen@intel.com> wrote:
>
> ./run_vmtests: line 217: ./test_vmalloc.sh: Permission denied

I marked that script executable:

  6bc3fe8e7e17 ("tools: mark 'test_vmalloc.sh' executable")

although perhaps the better fix would have been to explicitly use the
shell to start it in the 'run_vmtests' script instead?

We have a lot of files that aren't marked executable, probably because
they came in as (or were generated as) non-git patches. Often through
Andrew's workflow.

But most of them don't seem to matter, because they get run using
explicit script engines. So I only fixed up this one case.

             Linus

--===============2567553182696213126==--

