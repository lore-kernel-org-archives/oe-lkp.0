Content-Type: multipart/mixed; boundary="===============3147003455719620273=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [net/bpf] 3051bf36c2 BUG: unable to handle kernel paging request at 0000a7cf
Date: Wed, 08 Mar 2017 14:43:44 -0800
Message-ID: <CA+55aFwaNhP918b0zgpP8G6qGXHP+Qw69hEV+271tPMXu1+p8A@mail.gmail.com>
In-Reply-To: <58C08535.3070000@iogearbox.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============3147003455719620273==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 8, 2017 at 2:27 PM, Daniel Borkmann <daniel@iogearbox.net> wr=
ote:
>
> The issue seems to be accessing buff first (can be read or write access)
> and then doing set_memory_ro() doesn't make it read-only immediately,
> meaning the subsequent call into probe_kernel_write() will succeed without
> error.
>
> Then, if I don't touch buff first and only do the set_memory_ro() seems
> to work and probe_kernel_write() will then fail as expected due to pages
> being read-only now.

Ok, that definitely sounds like a TLB invalidate didn't happen.

> Now, if I access buff, do the set_memory_ro() and then a msleep(0), for
> example, it "kind of" works most of the time (see last log extract below),
> and probe_kernel_write() will fail.

Yeah, very much consistent with a missing TLB invalidate. Scheduling
will end up invalidating it, although if it's a global page even that
might not do it (but eventually the entry will just get flushed due to
other activity).

> None of this seems an issue with x86_64 and the test_setmem runs fine all
> the time, same for the actual BPF stuff.

The code does look somewhat confused about when to actually flush
things - see my earlier note about NX - but it would seem to always do
__flush_tlb_all() unless I missed something. At least as long as
CPA_FLUSHTLB is set. Maybe some case forgets to set that..

       Linus

--===============3147003455719620273==--

