Content-Type: multipart/mixed; boundary="===============6296626842536075255=="
MIME-Version: 1.0
From: Davidlohr Bueso <dave@stgolabs.net>
To: lkp@lists.01.org
Subject: Re: [mm] c8c06efa8b5: -7.6% unixbench.score
Date: Tue, 27 Jan 2015 12:43:45 -0800
Message-ID: <1422391425.4604.7.camel@stgolabs.net>
In-Reply-To: <1422344736.24875.47.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6296626842536075255==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 2015-01-27 at 15:45 +0800, Huang Ying wrote:
> Hi, Davidlohr,
> =

> Any update on this?  The latest news I gotten is that you finally
> reproduced this.

The overall differences and cause of the issue is commit 37e9562453b
(locking/rwsem: Allow conservative optimistic spinning when readers have
lock). And since the performance issue occurs with writers-only, I'm
fine with the degradation,  we need to learn to live it. Real use cases
will use mutexes instead. Also, the mentioned commit fixes a much more
important problem than pathologically calling exec(2).

Now, this doesn't mean we cannot do _anything_ about it. I sent a
patcshet just a few days ago (sorry, I forgot to Cc you) that tries to
minimalize (I've recovered ~75% of the regression) the writer penalties:
https://lkml.org/lkml/2015/1/26/34

So all in all we don't really care for writer-only workloads, but hey,
while we're at it.

Thanks,
Davidlohr


--===============6296626842536075255==--

