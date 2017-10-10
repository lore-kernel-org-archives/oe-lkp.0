Content-Type: multipart/mixed; boundary="===============0825724156147588933=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lockdep] b09be676e0 BUG: unable to handle kernel NULL pointer dereference at 000001f2
Date: Tue, 10 Oct 2017 09:56:26 -0700
Message-ID: <CA+55aFxqRb_rK8Fa_b8zL+jg3p43w81zkt5iWpFFfByY6Rx6vg@mail.gmail.com>
In-Reply-To: <CA+55aFzBfOcmqK2cZoAwfCpcQB22YF4HusUk9pGB1B17foTN5w@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0825724156147588933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 10, 2017 at 9:22 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I really would like to see the sites that do cross-thread lock/unlock
> pairs themselves be annotated.
>
> So when you lock in one thread, and then unlock in another, I'd
> actually prefer to see something like
>
>  - T1:
>         lock_mutex_cross();
>
>  - T2:
>         unlock_mutex_cross();
>
> to make it very explicit that *these* particular lock/unlock
> operations are the fancy ones.

Actually, let's make it even *more* obvious, and even easier for
lockdep (and for humans) to see what's going on.

So I think the best model would be something like this:

 - T1:
        mutex_lock(&lock)
        ...
        mutex_transfer(&lock)

 - T2:
        mutex_receive(&lock);
        ...
        mutex_unlock(&lock);

where the "mutex_transfer() -> mutex_receive()" thing really makes it
obvious that "now thread 1 is transferring the lock to thread 2".

And for lockdep, those transfer points will be easy to check: verify
that the "mutex_transfer()" is done with the lock held, and maybe
clear the lock ownership at that point (or set it to "in flight" or
whatever). And then "mutex_receive()" can verify that (a) the
ownership was that "in tranfer" thing and that it's still held, before
it then sets the ownership to thread 2.

Wouldn't that be easier for lockdep? And I think it would be much more
obvious to users too, and really document those places where we do
something odd and transfer ownership of a lock from one thread to
another?

                Linus

--===============0825724156147588933==--

