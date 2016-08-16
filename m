Content-Type: multipart/mixed; boundary="===============6795477736852522527=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Mon, 15 Aug 2016 17:50:24 -0700
Message-ID: <CA+55aFy2WxyUwYOx0SZiOc6PmG83XfW1uDznEM4mW0HpBf3Bvg@mail.gmail.com>
In-Reply-To: <20160816003826.GG16044@dastard>
List-Id: <oe-lkp.lists.linux.dev>

--===============6795477736852522527==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 15, 2016 at 5:38 PM, Dave Chinner <david@fromorbit.com> wrote:
>
> Same in 4.7 (flat profile numbers climbed higher after this
> snapshot was taken, as can be seen by the callgraph numbers):

Ok, so it's not the zone-vs-node thing.  It's just that nobody has
looked at that load in recent times.

Where "recent" may be years, of course.

                   Linus

--===============6795477736852522527==--

