Content-Type: multipart/mixed; boundary="===============5822101338364817531=="
MIME-Version: 1.0
From: Dave Martin <Dave.Martin@arm.com>
To: lkp@lists.01.org
Subject: Re: kernel/ptrace.c:788:2: error: implicit declaration of function 'update_tsk_thread_flag'; did you mean 'test_tsk_thread_flag'?
Date: Mon, 14 May 2018 16:22:13 +0100
Message-ID: <20180514152212.GM7753@e103592.cambridge.arm.com>
In-Reply-To: <201805121101.eJf2poNV%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5822101338364817531==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi folks,

Do you know where I can find the commit test the test robot tried to
build?  I saw now reference to a tree in the report, only a commit
id.

The commit referenced here is not upstream or in -next.  AFAIK the
affected patch wasn't merged in any maintainer tree so far.


The affected patch here changes the code to make use of a function
defined earlier in the same series.  I'm wondering whether the
robot has picked the patches individually or out of order...

Cheers
---Dave

--8<--

On Sat, May 12, 2018@04:16:03AM +0100, kbuild test robot wrote:
> bisected to: aa63d2d0803f9c47bd86bbece367bdf4823d8f33  thread_info: Port =
core code to use update_thread_flag() helpers
> commit date: 20 minutes ago
> config: i386-tinyconfig (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-16) 7.3.0
> reproduce:
>         git checkout aa63d2d0803f9c47bd86bbece367bdf4823d8f33
>         # save the attached .config to linux build tree
>         make ARCH=3Di386 =

> =

> All errors (new ones prefixed by >>):
> =

>    kernel/ptrace.c: In function 'ptrace_resume':
> >> kernel/ptrace.c:788:2: error: implicit declaration of function 'update=
_tsk_thread_flag'; did you mean 'test_tsk_thread_flag'? [-Werror=3Dimplicit=
-function-declaration]
>      update_tsk_thread_flag(child, TIF_SYSCALL_TRACE,
>      ^~~~~~~~~~~~~~~~~~~~~~
>      test_tsk_thread_flag
>    cc1: some warnings being treated as errors
> =

> vim +788 kernel/ptrace.c
> =

>    779	=

>    780	static int ptrace_resume(struct task_struct *child, long request,
>    781				 unsigned long data)
>    782	{
>    783		bool need_siglock;
>    784	=

>    785		if (!valid_signal(data))
>    786			return -EIO;
>    787	=

>  > 788		update_tsk_thread_flag(child, TIF_SYSCALL_TRACE,
>    789				       request =3D=3D PTRACE_SYSCALL);
>    790	=

> =

> ---
> 0-DAY kernel test infrastructure                Open Source Technology Ce=
nter
> https://lists.01.org/pipermail/kbuild-all                   Intel Corpora=
tion



--===============5822101338364817531==--

