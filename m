Content-Type: multipart/mixed; boundary="===============5583021404327214956=="
MIME-Version: 1.0
From: Sami Tolvanen <samitolvanen@google.com>
To: lkp@lists.01.org
Subject: Re: [x86, build] 6dafca9780: WARNING:at_arch/x86/kernel/ftrace.c:#ftrace_verify_code
Date: Mon, 01 Mar 2021 14:14:51 -0800
Message-ID: <CABCJKuc8H83b_8_Ccp+Cb7O9x5oEu6sPNq63sjGcAJcgiwy0bw@mail.gmail.com>
In-Reply-To: <20210301074027.GD12822@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5583021404327214956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 28, 2021 at 11:25 PM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with clang-13):
>
> commit: 6dafca97803309c3cb5148d449bfa711e41ddef2 ("x86, build: use objtoo=
l mcount")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Thanks for the report, I'm able to reproduce the warning.

> [    4.764496] ------------[ ftrace bug ]------------
> [    4.764847] ftrace failed to modify
> [    4.764852] do_sys_open (kbuild/src/consumer/fs/open.c:1186)
> [    4.765483]  actual:   0f:1f:44:00:00
> [    4.765784] Setting ftrace call site to call ftrace function
> [    4.766193] ftrace record flags: 50000001
> [    4.766490]  (1) R
> [    4.766490]  expected tramp: ffffffff81037af0
> [    4.766959] ------------[ cut here ]------------

Basically, the problem is that ftrace_replace_code() expects to find
ideal_nops[NOP_ATOMIC5] here, which in this case is 66:66:66:66:90,
while objtool has replaced the __fentry__ call with 0f:1f:44:00:00.

As ideal_nops changes depending on kernel config and hardware, when
CC_USING_NOP_MCOUNT is defined we could either change
ftrace_nop_replace() to always use P6_NOP5, or skip
ftrace_verify_code() in ftrace_replace_code() for
FTRACE_UPDATE_MAKE_CALL.

Steven, Peter, any thoughts?

Sami
--===============5583021404327214956==--

