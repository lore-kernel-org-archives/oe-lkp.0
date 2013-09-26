Content-Type: multipart/mixed; boundary="===============2151799344633347611=="
MIME-Version: 1.0
From: Andi Kleen <andi@firstfloor.org>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Wed, 25 Sep 2013 20:20:37 -0700
Message-ID: <87r4cc8e0q.fsf@tassilo.jf.intel.com>
In-Reply-To: <1380124944.27676.1.camel@monkey32>
List-Id: <oe-lkp.lists.linux.dev>

--===============2151799344633347611==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Lin Ming <minggr@gmail.com> writes:
>
> Would you like below patch?

The loop body keeps rather complex state. It could easily =

get confused by parallel RCU changes.

So if the list changes in parallel you may suddenly
report very bogus values, as the va_start - prev_end =

computation may be bogus.

Perhaps it's ok (may report bogus gaps), but it seems a bit risky.

-Andi

-- =

ak(a)linux.intel.com -- Speaking for myself only

--===============2151799344633347611==--

