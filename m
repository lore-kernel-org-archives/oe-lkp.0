Content-Type: multipart/mixed; boundary="===============8267256685951156951=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: d28296d248: stress-ng.sigsegv.ops_per_sec -82.7% regression
Date: Fri, 05 Mar 2021 11:56:44 -0600
Message-ID: <m1czwd32n7.fsf@fess.ebiederm.org>
In-Reply-To: <20210225203657.mjhaqnj5vszna5xw@example.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8267256685951156951==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Alexey Gladkov <gladkov.alexey@gmail.com> writes:

> On Wed, Feb 24, 2021 at 12:50:21PM -0600, Eric W. Biederman wrote:
>> Alexey Gladkov <gladkov.alexey@gmail.com> writes:
>> =

>> > On Wed, Feb 24, 2021 at 10:54:17AM -0600, Eric W. Biederman wrote:
>> >> kernel test robot <oliver.sang@intel.com> writes:
>> >> =

>> >> > Greeting,
>> >> >
>> >> > FYI, we noticed a -82.7% regression of stress-ng.sigsegv.ops_per_se=
c due to commit:
>> >> >
>> >> >
>> >> > commit: d28296d2484fa11e94dff65e93eb25802a443d47 ("[PATCH v7 5/7] R=
eimplement RLIMIT_SIGPENDING on top of ucounts")
>> >> > url: https://github.com/0day-ci/linux/commits/Alexey-Gladkov/Count-=
rlimits-in-each-user-namespace/20210222-175836
>> >> > base: https://git.kernel.org/cgit/linux/kernel/git/shuah/linux-ksel=
ftest.git next
>> >> >
>> >> > in testcase: stress-ng
>> >> > on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70G=
Hz with 112G memory
>> >> > with following parameters:
>> >> >
>> >> > 	nr_threads: 100%
>> >> > 	disk: 1HDD
>> >> > 	testtime: 60s
>> >> > 	class: interrupt
>> >> > 	test: sigsegv
>> >> > 	cpufreq_governor: performance
>> >> > 	ucode: 0x42e
>> >> >
>> >> >
>> >> > In addition to that, the commit also has significant impact on the
>> >> > following tests:
>> >> =

>> >> Thank you.  Now we have a sense of where we need to test the performa=
nce
>> >> of these changes carefully.
>> >
>> > One of the reasons for this is that I rolled back the patch that chang=
ed
>> > the ucounts.count type to atomic_t. Now get_ucounts() is forced to use=
 a
>> > spin_lock to increase the reference count.
>> =

>> Which given the hickups with getting a working version seems justified.
>> =

>> Now we can add incremental patches on top to improve the performance.
>
> I'm not sure that get_ucounts() should be used in __sigqueue_alloc() [1].
> I tried removing it and running KASAN tests that were failing before. So
> far, I have not found any problems.
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git/tree/ker=
nel/signal.c?h=3Dpatchset/per-userspace-rlimit/v7.1&id=3D2d4a2e2be7db42c95a=
cb98abfc2a9b370ddd0604#n428

Hmm.  The code you posted still seems to include the get_ucounts.

I like the idea of not needing to increment and decrement the ucount
reference count every time a signal is sent, unfortunately there is a
problem.  The way we have implemented setresuid allows different threads
in a threaded application to have different cred->user values.

That is actually an extension of what posix supports and pthreads will
keep the creds of a process in sync.  Still I recall looking into this a
few years ago and there were a few applications that take advantage of
the linux behavior.

In principle I think it is possible to hold a ucount reference in
somewhere such as task->signal.  In practice there are enough
complicating factors I don't immediately see how to implement that.

If the creds were stored in signal_struct instead of in task_struct
we could simply move the sigpending counts in set_user, when the uid
of a process changed.

With the current state I don't know how to pick which is the real user.

Eric
--===============8267256685951156951==--

