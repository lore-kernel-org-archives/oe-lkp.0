Content-Type: multipart/mixed; boundary="===============0787136602985671270=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 28 Nov 2018 13:39:36 -0500
Message-ID: <20181128183936.GF20740@redhat.com>
In-Reply-To: <CAHk-=wjgRO-=NPaU9EmrdC3it3o7kvf4u7sewv3crtNLkE13Hg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0787136602985671270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2018 at 08:48:46AM -0800, Linus Torvalds wrote:
> On Tue, Nov 27, 2018 at 7:20 PM Huang, Ying <ying.huang@intel.com> wrot=
e:
> >
> > From the above data, for the parent commit 3 processes exited within
> > 14s, another 3 exited within 100s.  For this commit, the first process
> > exited at 203s.  That is, this commit makes memory allocation more fair
> > among processes, so that processes proceeded at more similar speed.  But
> > this raises system memory footprint too, so triggered much more swap,
> > thus lower benchmark score.

Ok so it was the previous more unfair behavior that increased overall
performance. It was also unclear to me that this was a full swap storm
test.

> > In general, memory allocation fairness among processes should be a good
> > thing.  So I think the report should have been a "performance
> > improvement" instead of "performance regression".
> =

> Hey, when you put it that way...
> =

> Let's ignore this issue for now, and see if it shows up in some real
> workload and people complain.

Agreed.

With regard to the other question about 4.4 backports, 4.0 didn't have
__GFP_THISNODE, so this will still revert to the previous behavior and
it won't risk to land into uncharted territory. So there should be no
major concern for the backports.

We should still work on improving this area, for now the idea was to
apply a strict hotfix that would just revert to the previous behavior
without introducing new features and new APIs, that would also have
the side effect of diminishing THP utilization under MADV_HUGEPAGE.

Thanks!
Andrea

--===============0787136602985671270==--

