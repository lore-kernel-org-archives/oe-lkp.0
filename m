Content-Type: multipart/mixed; boundary="===============1549859414367600932=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 05 Dec 2018 15:51:06 -0800
Message-ID: <CAHk-=wguXjkbK8BUU998s7HD7AXJgBkuc9JmuNxiN7uGQyfSfQ@mail.gmail.com>
In-Reply-To: <20181205233632.GE11899@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1549859414367600932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 5, 2018 at 3:36 PM Andrea Arcangeli <aarcange@redhat.com> wro=
te:
>
> Like said earlier still better to apply __GFP_COMPACT_ONLY or David's
> patch than to return to v4.18 though.

Ok, I've applied David's latest patch.

I'm not at all objecting to tweaking this further, I just didn't want
to have this regression stand.

           Linus

--===============1549859414367600932==--

