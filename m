Content-Type: multipart/mixed; boundary="===============5275899255155291539=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [tracing] 06e0a548ba: WARNING:at_kernel/trace/ring_buffer.c:#ring_buffer_iter_peek
Date: Wed, 13 May 2020 12:25:24 -0400
Message-ID: <20200513122524.2352c105@gandalf.local.home>
In-Reply-To: <20200513161557.GA73453@tuxmaker.boeblingen.de.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5275899255155291539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 13 May 2020 18:15:57 +0200
Sven Schnelle <svens@linux.ibm.com> wrote:

> Thanks for looking into this. I've attached my /proc/config.gz to this Ma=
il.
> The x86 system is my Laptop which is a Thinkpad X280 with 4 HT CPUs (so 8=
 cpus
> in total). I've tried disabling preemption, but this didn't help.
> =

> It's always this check that causes the loop:
> =

> if (iter->head >=3D rb_page_size(iter->head_page)) {
> 	rb_inc_iter(iter);
> 	goto again;
> }
> =

> On the first loop iter->head is some value > 0 and rb_page_size returns
> 0, afterwards it gets twice to this check with both values 0. The third
> time the warning is triggered. Maybe that information helps.

Letting it run long enough, I was able to trigger it.

I think I know what's wrong with it. I'll put in some debugging to see if
my thoughts are accurate.

Thanks for bringing this back to my attention.

-- Steve
--===============5275899255155291539==--

