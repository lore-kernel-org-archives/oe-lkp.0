Content-Type: multipart/mixed; boundary="===============4496679218788384713=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.cz>
To: lkp@lists.01.org
Subject: Re: OOM in v4.8
Date: Wed, 12 Oct 2016 10:00:22 +0200
Message-ID: <20161012080022.GA17128@dhcp22.suse.cz>
In-Reply-To: <20161012074411.GA9523@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4496679218788384713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 12-10-16 09:44:11, Michal Hocko wrote:
> [Let's CC Vlastimil]
> =

> On Wed 12-10-16 14:54:23, Aaron Lu wrote:
> > Hello,
> > =

> > There is a chromeswap test case:
> > https://chromium.googlesource.com/chromiumos/third_party/autotest/+/mas=
ter/client/site_tests/platform_CompressedSwapPerf
> > =

> > We have done small changes and ported it to our LKP environment:
> > https://github.com/aaronlu/chromeswap
> > =

> > The test starts nr_procs processes and let them each allocate some
> > memory equally with realloc, so anonymous pages are used. When the
> > pre-specified swap_target is reached, the allocation will stop. The
> > total allocation size is: MemFree + swap_target * SwapTotal.
> > After allocation, a random process is selected to touch its memory to
> > trigger swap in/out.
> > =

> > For this test, nr_procs is 50 and swap_target is 50%.
> > The test box has 8G memory where 4G is used as a pmem block device and
> > created as the swap partition.
> > =

> > There is OOM occured for this test recently so I did more tests:
> > on v4.6, 10 tests all pass;
> > on v4.7, 2 tests OOMed out of 10 tests;
> > on v4.8, 6 tests OOMed out of 10 tests;
> > on 101105b1717f, which is yersterday's Linus' master branch head,
> > 1 test OOMed out of 10 tests.
> =

> Could you try to retest with the current linux-next please?

And I am obviously blind because you have already tested with
101105b1717f which contains the Andrew patchbomb and so all the relevant
changes. Now that I am lookinig into your log for that kernel there
doesn't seem to be any OOM killer invocation. There is only
kern  :warn  : [  177.175954] perf: page allocation failure: order:2, mode:=
0x208c020(GFP_ATOMIC|__GFP_COMP|__GFP_ZERO)

which is an atomic high order request that failed which is not all that
unexpected when the system is low on memory. The allocation failure
report is hard to read because of unexpected end-of-lines but I suspect
that again we are not able to allocate because of the CMA standing in
the way. I wouldn't call the above failure critical though.
-- =

Michal Hocko
SUSE Labs

--===============4496679218788384713==--

