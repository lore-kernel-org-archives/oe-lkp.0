Content-Type: multipart/mixed; boundary="===============0124001657339492266=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: kernel/ptrace.c:788:2: error: implicit declaration of function 'update_tsk_thread_flag'; did you mean 'test_tsk_thread_flag'?
Date: Tue, 15 May 2018 07:18:48 +0800
Message-ID: <20180514231848.5uasycynibijsgdj@wfg-t540p.sh.intel.com>
In-Reply-To: <20180514152212.GM7753@e103592.cambridge.arm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0124001657339492266==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

CC LKP team. Something went wrong with our robot -- there should be
tree/branch information in this report.

On Mon, May 14, 2018 at 04:22:13PM +0100, Dave Martin wrote:
>Hi folks,
>
>Do you know where I can find the commit test the test robot tried to
>build?  I saw now reference to a tree in the report, only a commit
>id.

It's your patch applied to linus tree:

$ git log aa63d2d0803f9c47bd86bbece367bdf4823d8f33
commit aa63d2d0803f9c47bd86bbece367bdf4823d8f33
Author:     Dave Martin <Dave.Martin@arm.com>
AuthorDate: Fri May 11 16:05:00 2018 +0100
Commit:     0day robot <lkp@intel.com>
CommitDate: Sat May 12 10:56:26 2018 +0800

    thread_info: Port core code to use update_thread_flag() helpers

    This patch ports a couple of relevant bits of the core kernel to
    use the new update_thread_flag() helpers.

    No functional change.

    Signed-off-by: Dave Martin <Dave.Martin@arm.com>
    Cc: Ingo Molnar <mingo@redhat.com>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Cc: Steven Rostedt <rostedt@goodmis.org>
    Cc: Oleg Nesterov <oleg@redhat.com>

commit 008464a9360e31b14677457dcd976fbf9dd58e2e
Merge: 036db8bd96374 070b9637dd8fa
Author:     Linus Torvalds <torvalds@linux-foundation.org>
AuthorDate: Wed May 9 10:49:52 2018 -1000
Commit:     Linus Torvalds <torvalds@linux-foundation.org>
CommitDate: Wed May 9 10:49:52 2018 -1000

    Merge branch 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/g=
it/jikos/hid

>The commit referenced here is not upstream or in -next.  AFAIK the
>affected patch wasn't merged in any maintainer tree so far.
>
>
>The affected patch here changes the code to make use of a function
>defined earlier in the same series.  I'm wondering whether the
>robot has picked the patches individually or out of order...

Thanks,
Fengguang

>On Sat, May 12, 2018 at 04:16:03AM +0100, kbuild test robot wrote:
>> bisected to: aa63d2d0803f9c47bd86bbece367bdf4823d8f33  thread_info: Port=
 core code to use update_thread_flag() helpers
>> commit date: 20 minutes ago
>> config: i386-tinyconfig (attached as .config)
>> compiler: gcc-7 (Debian 7.3.0-16) 7.3.0
>> reproduce:
>>         git checkout aa63d2d0803f9c47bd86bbece367bdf4823d8f33
>>         # save the attached .config to linux build tree
>>         make ARCH=3Di386
>>
>> All errors (new ones prefixed by >>):
>>
>>    kernel/ptrace.c: In function 'ptrace_resume':
>> >> kernel/ptrace.c:788:2: error: implicit declaration of function 'updat=
e_tsk_thread_flag'; did you mean 'test_tsk_thread_flag'? [-Werror=3Dimplici=
t-function-declaration]
>>      update_tsk_thread_flag(child, TIF_SYSCALL_TRACE,
>>      ^~~~~~~~~~~~~~~~~~~~~~
>>      test_tsk_thread_flag
>>    cc1: some warnings being treated as errors
>>
>> vim +788 kernel/ptrace.c
>>
>>    779	=

>>    780	static int ptrace_resume(struct task_struct *child, long request,
>>    781				 unsigned long data)
>>    782	{
>>    783		bool need_siglock;
>>    784	=

>>    785		if (!valid_signal(data))
>>    786			return -EIO;
>>    787	=

>>  > 788		update_tsk_thread_flag(child, TIF_SYSCALL_TRACE,
>>    789				       request =3D=3D PTRACE_SYSCALL);
>>    790	=

>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology C=
enter
>> https://lists.01.org/pipermail/kbuild-all                   Intel Corpor=
ation
>
>

--===============0124001657339492266==--

