Content-Type: multipart/mixed; boundary="===============3714556365308389214=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 20:20:53 -0700
Message-ID: <CA+55aFyhrDXK00mkAdLiXZVy-8=2U2WtRMwPYFF8z-JDwzuodQ@mail.gmail.com>
In-Reply-To: <20160812025218.GB975@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============3714556365308389214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 7:52 PM, Christoph Hellwig <hch@lst.de> wrote:
>
> I can look at that, but indeed optimizing this patch seems a bit
> stupid.

The "write less than a full block to the end of the file" is actually
a reasonably common case.

It may not make for a great filesystem benchmark, but it also isn't
actually insane. People who do logging in user space do this all the
time, for example. And it is *not* stupid in that context. Not at all.

It's never going to be the *main* thing you do (unless you're AIM),
but I do think it's worth fixing.

And AIM7 remains one of those odd benchmarks that people use. I'm not
quite sure why, but I really do think that the normal "append smaller
chunks to the end of the file" should absolutely not be dismissed as
stupid.

                Linus

--===============3714556365308389214==--

