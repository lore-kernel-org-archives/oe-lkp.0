Content-Type: multipart/mixed; boundary="===============0034151610972371583=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [tracing] 06e0a548ba: WARNING:at_kernel/trace/ring_buffer.c:#ring_buffer_iter_peek
Date: Wed, 13 May 2020 09:29:22 -0400
Message-ID: <20200513092922.6d79f6ee@gandalf.local.home>
In-Reply-To: <20200513091906.GA12720@tuxmaker.boeblingen.de.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0034151610972371583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 13 May 2020 11:19:06 +0200
Sven Schnelle <svens@linux.ibm.com> wrote:

> Did you had a chance to look into this? I can easily reproduce this both =
on x86
> and s390 by doing:
> =

> cd /sys/kernel/tracing
> cat /dev/zero >/dev/null & # generate some load
> echo function >current_tracer
> # wait a few seconds to fill the buffer
> cat trace
> =

> Usually it will print the warn after a few seconds.
> =

> I haven't digged through all the ring buffer code yet, so i thought i mig=
ht ask
> whether you have an idea what's going on.

Can you send me the config for where you can reproduce it on x86?

The iterator now doesn't stop the ring buffer when it iterates, and is
doing so over a live buffer (but should be able to handle it). It's
triggering something I thought wasn't suppose to happen (which must be
happening).

Perhaps with your config I'd be able to reproduce it.

-- Steve
--===============0034151610972371583==--

