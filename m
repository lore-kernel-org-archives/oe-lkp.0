Content-Type: multipart/mixed; boundary="===============2613516666348892782=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Tue, 27 Nov 2018 14:50:05 -0800
Message-ID: <CAHk-=wiEUPBzAOPkH1aHypnxW6+vVtmCw_vsOPgNZtOvQnrG8w@mail.gmail.com>
In-Reply-To: <20181127205737.GI16136@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2613516666348892782==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 27, 2018 at 12:57 PM Andrea Arcangeli <aarcange@redhat.com> w=
rote:
>
> This difference can only happen with defrag=3Dalways, and that's not the
> current upstream default.

Ok, thanks. That makes it a bit less critical.

> That MADV_HUGEPAGE causes flights with NUMA balancing is not great
> indeed, qemu needs NUMA locality too, but then the badness caused by
> __GFP_THISNODE was a larger regression in the worst case for qemu.
[...]
> So the short term alternative again would be the alternate patch that
> does __GFP_THISNODE|GFP_ONLY_COMPACT appended below.

Sounds like we should probably do this. Particularly since Vlastimil
pointed out that we'd otherwise have issues with the back-port for 4.4
where that "defrag=3Dalways" was the default.

The patch doesn't look horrible, and it directly addresses this
particular issue.

Is there some reason we wouldn't want to do it?

               Linus

--===============2613516666348892782==--

