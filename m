Content-Type: multipart/mixed; boundary="===============6996702657244751934=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Wed, 28 Nov 2018 08:48:46 -0800
Message-ID: <CAHk-=wjgRO-=NPaU9EmrdC3it3o7kvf4u7sewv3crtNLkE13Hg@mail.gmail.com>
In-Reply-To: <87tvk1yjkp.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6996702657244751934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 27, 2018 at 7:20 PM Huang, Ying <ying.huang@intel.com> wrote:
>
> From the above data, for the parent commit 3 processes exited within
> 14s, another 3 exited within 100s.  For this commit, the first process
> exited at 203s.  That is, this commit makes memory allocation more fair
> among processes, so that processes proceeded at more similar speed.  But
> this raises system memory footprint too, so triggered much more swap,
> thus lower benchmark score.
>
> In general, memory allocation fairness among processes should be a good
> thing.  So I think the report should have been a "performance
> improvement" instead of "performance regression".

Hey, when you put it that way...

Let's ignore this issue for now, and see if it shows up in some real
workload and people complain.

                     Linus

--===============6996702657244751934==--

