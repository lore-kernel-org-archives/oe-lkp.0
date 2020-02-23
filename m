Content-Type: multipart/mixed; boundary="===============5364713097711320109=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Sun, 23 Feb 2020 09:37:06 -0800
Message-ID: <CAHk-=wjKFTzfDWjAAabHTZcityeLpHmEQRrKdTuk0f4GWcoohQ@mail.gmail.com>
In-Reply-To: <20200223141147.GA53531@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5364713097711320109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2020 at 6:11 AM Feng Tang <feng.tang@intel.com> wrote:
>
> I tried to use perf-c2c on one platform (not the one that show
> the 5.5% regression), and found the main "hitm" points to the
> "root_user" global data, as there is a task for each CPU doing
> the signal stress test, and both __sigqueue_alloc() and
> __sigqueue_free() will call get_user() and free_uid() to inc/dec
> this root_user's refcount.

What's around it for you?

There might be that 'uidhash_lock' spinlock right next to it, and
maybe that exacerbates the issue?

> Then I added some alignement inside struct "user_struct" (for
> "root_user"), then the -5.5% is gone, with a +2.6% instead.

Do you actually need to align things inside the struct, or is it
sufficient to just align the structure itself?

IOW, is the cache conflicts _within_ the user_struct itself, or is it
with some nearby data (like that uidhash_lock or whatever?)

> One thing I don't understand is, this -5.5% only happens in
> one 2 sockets, 96C/192T Cascadelake platform, as we've run
> the same test on several different platforms. In therory,
> the false sharing may also take effect?

Is that the biggest machine you have access to?

Maybe it just isn't noticeable with smaller core counts. A lot of
conflict loads tend to have "exponential" behavior - when things get
overloaded, performance plummets because it just makes things worse as
everybody gets slower at that contention point and now it gets even
more contended...

             Linus
--===============5364713097711320109==--

