Content-Type: multipart/mixed; boundary="===============4906034629961808757=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 10:01:18 -0800
Message-ID: <CAHk-=wjgpWOA7zQ9H5=Zj6KQijm5CBXZc7J=it6C5gdEV0hb5Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjgRO-=NPaU9EmrdC3it3o7kvf4u7sewv3crtNLkE13Hg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4906034629961808757==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2018 at 8:48 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Nov 27, 2018 at 7:20 PM Huang, Ying <ying.huang@intel.com> wrot=
e:
> >
> > In general, memory allocation fairness among processes should be a good
> > thing.  So I think the report should have been a "performance
> > improvement" instead of "performance regression".
>
> Hey, when you put it that way...
>
> Let's ignore this issue for now, and see if it shows up in some real
> workload and people complain.

Well, David Rientjes points out that it *does* cause real problems in
real workloads, so it's not just this benchmark run that shows the
issue.

So I guess we should revert, or at least fix. David, please post your
numbers again in public along with your suggested solution...

                   Linus

--===============4906034629961808757==--

