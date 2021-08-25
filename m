Content-Type: multipart/mixed; boundary="===============1656021933770701734=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [pipe] 3b844826b6: stress-ng.sigio.ops_per_sec -99.3% regression
Date: Wed, 25 Aug 2021 10:25:08 -0700
Message-ID: <CAHk-=wi0yqX8ChE=6aBivtgm65CGb3vf6meQbZxDczn9BznqTA@mail.gmail.com>
In-Reply-To: <875yvtpqbc.fsf@disp2133>
List-Id: <oe-lkp.lists.linux.dev>

--===============1656021933770701734==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 25, 2021 at 7:11 AM Eric W. Biederman <ebiederm@xmission.com>=
 wrote:
>
> We have two things going on, a pipe wake up and signal wake up.
>
> Does their order matter?  It feels weird that it is possible that
> the data can be read from the pipe and the reader woken up to write
> more when the signal that notifies the reader of that state has
> not even been queued for delivery.

I don't think the order matters.

The only thing that matters is that the signal (and the regular
wakeup, for that matter) is donme *after* the operation that triggers
them is complete. It would be problematic if we sent the signal for
"you can read more now" before we had actually done the write, so that
the recipient would then try to read and get a "nothing there".

But if you have both a pending reader, and something that asked for
SIGIO, they'll both get notified. Not in any particular orfder between
those two, but both will be notified after the write (or read) that
triggered it has been done.

Of course, the pending reader/writer that gets notified might be the
_same_ one that also gets the SIGIO, so you could then have the SIGIO
mean that the reader/writer gets EINTR and needs to read/write again.
If you asked for both, you'll get it.

The way our pipe code is organized, the _likely_ case is that you'll
do the read/write and take the signal handler without ever getting
-EAGAIN.  Because we'll test for "do we have more data" before we test
for "do we have signals pending" - but that's not really relevant for
correctness (it's more a greedy "let's try to read while possible" and
could be good for avoiding extra system calls).

And I think it was actually a historical mistake to tie the "send
SIGIO" together so tightly with "wake up other side". So my untested
patch (well, it's now tested by Oliver) is likely the right thing to
do regardless.

Basically, the "wake up readers/writers" thing is the one where we
*know* the other side - it's just the other end, and it's the kernel
code in the same fs/pipe.c file. So we can - and should - optimize
against doing unnecessary wakeups.

But as has now been shown several times, we shouldn't optimize the
case where the wakups are sent to code we don't control - ie user
space. Whether that be as a result of epoll, or as a signal delivery,
that "other side" is not under our control and clearly doesn't want
the optimal minimal wakeups for just state transition cases.

Of course, I could always wish that the receiving side always did the
right thing, and worked with the minimal state transition data, but
that clearly simply isn't the case. It wasn't the case for EPOLLET,
and it wasn't the case for SIGIO.

"If wishes were horses ..."

So I'll commit that SIGIO fix, even if Colin has already changed
stress-ng. No real harm in just doing both belt and suspenders, and I
was wrong last time when I thought the EPOLLET thing was purely a
test-suite issue.

Let nobody say that I can't learn from my mistakes..

                 Linus
--===============1656021933770701734==--

