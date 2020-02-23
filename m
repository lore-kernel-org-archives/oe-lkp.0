Content-Type: multipart/mixed; boundary="===============8051394137515131471=="
MIME-Version: 1.0
From: Jiri Olsa <jolsa@redhat.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Sun, 23 Feb 2020 20:36:24 +0100
Message-ID: <20200223193624.GA16664@krava>
In-Reply-To: <20200223141147.GA53531@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8051394137515131471==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2020 at 10:11:47PM +0800, Feng Tang wrote:
> Hi Jiri,

hi,

> =

> On Fri, Feb 21, 2020 at 02:20:48PM +0100, Jiri Olsa wrote:
> =

> > > We are also curious that the commit seems to be completely not
> > > relative to this scalability test of signal, which starts a task
> > > for each online CPU, and keeps calling raise(), and calculating
> > > the run numbers.
> > > =

> > > One experiment we did is checking which part of the commit
> > > really affects the test, and it turned out to be the change of
> > > "struct pmu". Effectively, applying this patch upon 5.0-rc6 =

> > > which triggers the same regression.
> > > So likely, this commit changes the layout of the kernel text
> > > and data, which may trigger some cacheline level change. From
> > > the system map of the 2 kernels, a big trunk of symbol's address
> > > changes which follow the global "pmu",
> > =

> > nice, I wonder we could see that in perf c2c output ;-)
> > I'll try to run and check
> =

> Thanks for the "perf c2c" suggestion. =


I'm fighting with lkp tests.. looks like it's not fedora friendly ;-)

which specific test is doing this? perhaps I can dig it out and run
without the script machinery..

> =

> I tried to use perf-c2c on one platform (not the one that show
> the 5.5% regression), and found the main "hitm" points to the
> "root_user" global data, as there is a task for each CPU doing
> the signal stress test, and both __sigqueue_alloc() and
> __sigqueue_free() will call get_user() and free_uid() to inc/dec
> this root_user's refcount.
> =

> Then I added some alignement inside struct "user_struct" (for
> "root_user"), then the -5.5% is gone, with a +2.6% instead.

could you share the change?

> =

> One c2c report log is attached.

could you also post one (for same data) without the callchains?

  # perf c2c report --stdio --call-graph none

it should show the read/write/offset for cachelines in more
readable way

I'd be also interested to see the data if you can share (no worries
if not) ... I'd need the perf.data and bz2 file from 'perf archive'
run on the perf.data

> =

> One thing I don't understand is, this -5.5% only happens in
> one 2 sockets, 96C/192T Cascadelake platform, as we've run
> the same test on several different platforms. In therory,
> the false sharing may also take effect? =


I don't have access to cascade lake, but AFAICT the bigger
machine the bigger issues with false sharing ;-)

jirka

--===============8051394137515131471==--

