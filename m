Content-Type: multipart/mixed; boundary="===============4780621472886048249=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [cfs_trace_lock_tcd] BUG: KASAN: null-ptr-deref in cfs_trace_lock_tcd+0x25/0xeb
Date: Wed, 18 Apr 2018 11:37:21 -0700
Message-ID: <CA+55aFz=VCq6w=kH5aYavOM0-h130HgzVhVc94JxeYSdbMWbxg@mail.gmail.com>
In-Reply-To: <20180418134058.l3orjjxcpv7cxjfw@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4780621472886048249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Ugh, that lustre code is disgusting.

I thought we were getting rid of it.

Anyway, I started looking at why the stack trace is such an incredible
mess, with lots of stale entries.

The reason (well, _one_ reason) seems to be "ksocknal_startup". It has
a 500-byte stack frame for some incomprehensible reason. I assume due
to excessive inlining, because the function itself doesn't seem to be
that bad.

Similarly, LNetNIInit has a 300-byte stack frame. So it gets pretty deep.

I'm getting the feeling that KASAN is making things worse because
probably it's disabling all the sane stack frame stuff (ie no merging
of stack slot entries, perhaps?).

Without KASAN (but also without a lot of other things, so I might be
blaming KASAN incorrectly), the stack usage of ksocknal_startup() is
just under 100 bytes, so if it is KASAN, it's really a big difference.

Anyway, apart from the excessive elements, the report seems fine, but
I'm adding Neil Brown to the cc, since he's the one that has been
making most of the lustre/lnet changes this merge window.

Also adding Andrey to check about the oddly large stack usage.

Not including the whole email with the attachements - Neil, it's on
lkml and lustre-devel if you hadn't seen it.

                Linus

--===============4780621472886048249==--

