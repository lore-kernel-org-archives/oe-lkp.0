Content-Type: multipart/mixed; boundary="===============7137764070781958347=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [gup] 17839856fd: stress-ng.vm-splice.ops_per_sec 2158.6% improvement
Date: Mon, 15 Jun 2020 12:09:58 -0700
Message-ID: <CAHk-=wgAH-yXX=1T_hqenVVmQPVKP-dkRKKkHYcWAXK0tRzz6Q@mail.gmail.com>
In-Reply-To: <CAG48ez1v1b4X5LgFya6nvi33-TWwqna_dc5jGFVosqQhdn_Nkg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7137764070781958347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2020 at 12:33 AM Jann Horn <jannh@google.com> wrote:
>
> So in summary I guess the test was just really slow up until now
> because it was hitting a slowpath that you wouldn't hit during normal
> usage? At least for vmsplice(), writing uninitialized pages doesn't
> really make a whole lot of sense...

Heh. My main worry with that commit was that we'd see the reverse
effect: somebody implicitly depending on the continued sharing of
pages in some odd splice situation, and where breaking the COW would
result in a performance degradation.

The fact that it went the other way instead is somewhat ironic.

But good.

I guess I'll just ping the stable people to say "yeah, put that in
stable too". It's a fix, and apparently it _helps_ performance for the
degenerate cases rather than hurting anything.

             Linus
--===============7137764070781958347==--

