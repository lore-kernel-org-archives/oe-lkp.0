Content-Type: multipart/mixed; boundary="===============3522028710119029180=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86] d55564cfc2: will-it-scale.per_thread_ops -5.8% regression
Date: Thu, 07 Jan 2021 11:33:36 -0800
Message-ID: <CAHk-=whneXU5Sr=iOOrzcqZt6q85zp-8CUSviOwGPj5ePBW4CQ@mail.gmail.com>
In-Reply-To: <20210107190445.GK3579531@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============3522028710119029180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 7, 2021 at 11:04 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> BTW, changing 'event' field in place from another thread is going to
> be interesting - you have two 16bit values next to each other and
> two CPUs modifying those with no exclusion.  Sounds like a recipe
> for massive trouble...

It's perfectly fine on just about anything else than on an original
pre-ev5 alpha.

The C standard even - finally - made it a requirement that accesses to
different members can't introduce data races.

So I agree with you that it's a bit annoying, and it's likely not even
very common, but I could easily imagine myself writing code that
changes either 'fd' or 'events' in a threaded server.

That's pretty much the whole point of 'poll()' after all - threaded
servers that have that convenient array of pollable file descriptors.

Maybe the pollfd array in many cases ends up being thread-local,
possibly generated from some other data structure each time. But if it
is some performance-critical thing (and I can't imagine a lot of more
performance-critical things than the core poll() loop), I can very
easily imagine it being re-used in between poll() calls, and people
modifying it from signal handlers and other threads as the set of
pollable file descriptors change due to new connections etc.

But I'll be honest - I didn't try to actually find such code, and I
suspect 99% of all cases would be happy with your "copy everything".

In fact, even some threaded app that does what I suspect it could do
would likely be ok with it 99% of the time. Because the situation
where you change the fd in the poll array is likely not the common
case, and even if some -1 file descriptor gets overwritten by a valid
one by the poll() system call again, it probably ends up being very
hard to see a failure.

Which just makes me even more nervous.

But I'm sure that yes, on platforms like s390, that "only write 16
bits out of every 64 bits" loop is probably pretty painful.

On most normal architectures it's probably a wash. I doubt it is
measurable on x86, for example.

           Linus
--===============3522028710119029180==--

