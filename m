Content-Type: multipart/mixed; boundary="===============4519076413556702249=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] f26b3fa046: netperf.Throughput_Mbps -18.0% regression
Date: Tue, 10 May 2022 12:25:17 -0700
Message-ID: <CAHk-=wjpkeoyKVf9GVPcddFUDM1+fzFHmoseNZAcqAtjd3D85A@mail.gmail.com>
In-Reply-To: <CAHk-=wiEtdHOeBti66NpSZDQw0KxcU45UNHaO-+Zwbiq3JEu+g@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4519076413556702249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2022 at 12:03 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I think the PV case already basically does that - replacing the the
> "store release" with a much more complex sequence. No?

Looking around, the PV case is absolutely horrid, and does a
cmpxchg_release() on the unlock path. Yeah, that would make the unlock
*much* more expensive.

And I guess that's fairly fundamental. Even if you were to avoid an
explicitly atomic access - do the unlock a non-atomic write followed
by a non-atomic "read pending and see if we need to something
expensive", just that check would have to involve at a minimum a
memory barrier, so it ends up being expensive even for the
non-contended case.

              Linus
--===============4519076413556702249==--

