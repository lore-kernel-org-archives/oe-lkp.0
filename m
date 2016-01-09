Content-Type: multipart/mixed; boundary="===============0449455680272803672=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] vmstat: allocate vmstat_wq before it is used
Date: Fri, 08 Jan 2016 16:16:37 -0800
Message-ID: <CA+55aFySZnN0B1rO4iOnFBfAHStzBZS1v8dans1wTn1Uv6Qmtw@mail.gmail.com>
In-Reply-To: <CA+55aFxGty1okA9wwsGH7vjr89T6ZTOTjHHp+1OH8dZkj=3JwA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0449455680272803672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 8, 2016 at 4:13 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Was there confirmation this fixed the issue? Just verifying..

Oh, and Tetsuo claims that it needs a cc stable regardless, because
the commit that caused this to appear was marked for stable and
already got backported. Yes?

                   Linus

--===============0449455680272803672==--

