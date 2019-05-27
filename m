Content-Type: multipart/mixed; boundary="===============1611328835393527362=="
MIME-Version: 1.0
From: David Sterba <dsterba@suse.cz>
To: lkp@lists.01.org
Subject: Re: [btrfs] 2996e1f8bc: aim7.jobs-per-min -13.2% regression
Date: Mon, 27 May 2019 13:49:14 +0200
Message-ID: <20190527114914.GG15290@suse.cz>
In-Reply-To: <20190527091719.GS19312@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============1611328835393527362==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2019 at 05:17:19PM +0800, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -13.2% regression of aim7.jobs-per-min due to commit:

That's interesting and worth an investigation. This should not happen,
the code is almost the same, moved from one function to another and the
call is direct. I'd suspect some low-level causes like cache effects or
branching, the perf-stats.i.* show some differences.

Other stats say (slabinfo.*extent_buffer) that there was less work over
the period. The slab object counter says that the object reuse was
higher in the bad case.

And there are many stats that show two digit difference, I'm trying to
make some sense of that, eg. if memory placement on NUMA nodes can
affect the speed of checksumming (changed by the patch)

So I wonder how reliable the test is and if it really does the same
thing in both cases or if there's some subtle change in the patch that
we've missed.

--===============1611328835393527362==--

