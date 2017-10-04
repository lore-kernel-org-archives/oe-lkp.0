Content-Type: multipart/mixed; boundary="===============1588031375982237511=="
MIME-Version: 1.0
From: Fengguang Wu <fengguang.wu@intel.com>
To: lkp@lists.01.org
Subject: Re: d82fed7529 ("locking/lockdep/selftests: Fix mixed read-write .."): BUG: -1 unexpected failures (out of 262) - debugging disabled! |
Date: Wed, 04 Oct 2017 09:04:23 +0800
Message-ID: <20171004010423.yjuhkr43aqh42qns@wfg-t540p.sh.intel.com>
In-Reply-To: <20170830074159.GB660@worktop.programming.kicks-ass.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1588031375982237511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2017 at 09:41:59AM +0200, Peter Zijlstra wrote:
>On Wed, Aug 30, 2017 at 08:29:47AM +0200, Peter Zijlstra wrote:
>> On Wed, Aug 30, 2017 at 11:37:21AM +0800, kernel test robot wrote:
>>
>> > [    0.004000] -------------------------------------------------------=
----------
>> > [    0.004000] BUG:  -1 unexpected failures (out of 262) - debugging d=
isabled! |
>> > [    0.004000] -------------------------------------------------------=
----------
>>
>> lol.. however did that happen.. /me goes look.
>
>Ah, I think this should cure..

It works!

Tested-by: Fengguang Wu <fengguang.wu@intel.com>

>---
>diff --git a/lib/locking-selftest.c b/lib/locking-selftest.c
>index cd0b5c964bd0..2b827b8a1d8c 100644
>--- a/lib/locking-selftest.c
>+++ b/lib/locking-selftest.c
>@@ -2031,11 +2031,13 @@ void locking_selftest(void)
> 	print_testname("mixed read-lock/lock-write ABBA");
> 	pr_cont("             |");
> 	dotest(rlock_ABBA1, FAILURE, LOCKTYPE_RWLOCK);
>+#ifdef CONFIG_PROVE_LOCKING
> 	/*
> 	 * Lockdep does indeed fail here, but there's nothing we can do about
> 	 * that now.  Don't kill lockdep for it.
> 	 */
> 	unexpected_testcase_failures--;
>+#endif
>
> 	pr_cont("             |");
> 	dotest(rwsem_ABBA1, FAILURE, LOCKTYPE_RWSEM);

--===============1588031375982237511==--

