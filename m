Content-Type: multipart/mixed; boundary="===============2602593421185522917=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Mon, 24 Feb 2020 08:33:01 +0800
Message-ID: <20200224003301.GA5061@shbuild999.sh.intel.com>
In-Reply-To: <CAHk-=wjKFTzfDWjAAabHTZcityeLpHmEQRrKdTuk0f4GWcoohQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2602593421185522917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Sun, Feb 23, 2020 at 09:37:06AM -0800, Linus Torvalds wrote:
> On Sun, Feb 23, 2020 at 6:11 AM Feng Tang <feng.tang@intel.com> wrote:
> >
> > I tried to use perf-c2c on one platform (not the one that show
> > the 5.5% regression), and found the main "hitm" points to the
> > "root_user" global data, as there is a task for each CPU doing
> > the signal stress test, and both __sigqueue_alloc() and
> > __sigqueue_free() will call get_user() and free_uid() to inc/dec
> > this root_user's refcount.
> =

> What's around it for you?
> =

> There might be that 'uidhash_lock' spinlock right next to it, and
> maybe that exacerbates the issue?

The system map shows:

	ffffffff8225b520 d __syscall_meta__ptrace
	ffffffff8225b560 d args__ptrace
	ffffffff8225b580 d types__ptrace
	ffffffff8225b5c0 D root_user
	ffffffff8225b680 D init_user_ns
	ffffffff8225b880 d ratelimit_state.56624
	ffffffff8225b8c0 d event_exit__sigsuspend

I also searched the uidhack_lock, =

	ffffffff82b04c80 b uidhash_lock
 =

> > Then I added some alignement inside struct "user_struct" (for
> > "root_user"), then the -5.5% is gone, with a +2.6% instead.
> =

> Do you actually need to align things inside the struct, or is it
> sufficient to just align the structure itself?

Initially I justed add the ____cacheline_aligned after the definition
of struct 'user_struct', which only makes the following 'init_user_ns'
aligned, and test result doesn't show much change.

Then I added
	=

	 struct user_struct {
	 +       char dummy[0] ____cacheline_aligned;

to make 'root_user' itself aligned. =



> IOW, is the cache conflicts _within_ the user_struct itself, or is it
> with some nearby data (like that uidhash_lock or whatever?)

>From the perf c2c data, and the source code checking, the conflicts
only happens for root_user.__count, and root_user.sigpending, as
all running tasks are accessing this global data for get/put and
other operations.

> > One thing I don't understand is, this -5.5% only happens in
> > one 2 sockets, 96C/192T Cascadelake platform, as we've run
> > the same test on several different platforms. In therory,
> > the false sharing may also take effect?
> =

> Is that the biggest machine you have access to?
> =

> Maybe it just isn't noticeable with smaller core counts. A lot of
> conflict loads tend to have "exponential" behavior - when things get
> overloaded, performance plummets because it just makes things worse as
> everybody gets slower at that contention point and now it gets even
> more contended...

No, it's not the biggest, I tried another machine 'Xeon Phi(TM) CPU 7295',
which has 72C/288T, and the regression is not seen. This is the part
confusing me :)

Also I've tried to limit the concurrent task number from 192 to 96/48/24/6/=
1,
and the regression number did get smaller following the task decrease. =


Thanks,
Feng
 =

>              Linus
--===============2602593421185522917==--

