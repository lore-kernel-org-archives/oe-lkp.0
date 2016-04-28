Content-Type: multipart/mixed; boundary="===============2999514647921069612=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, oom] faad2185f4: vm-scalability.throughput -11.8% regression
Date: Thu, 28 Apr 2016 13:17:08 +0800
Message-ID: <20160428051659.GA10843@aaronlu.sh.intel.com>
In-Reply-To: <20160427091718.GG2179@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2999514647921069612==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 27, 2016 at 11:17:19AM +0200, Michal Hocko wrote:
> On Wed 27-04-16 16:44:31, Huang, Ying wrote:
> > Michal Hocko <mhocko@kernel.org> writes:
> > =

> > > On Wed 27-04-16 16:20:43, Huang, Ying wrote:
> > >> Michal Hocko <mhocko@kernel.org> writes:
> > >> =

> > >> > On Wed 27-04-16 11:15:56, kernel test robot wrote:
> > >> >> FYI, we noticed vm-scalability.throughput -11.8% regression with =
the following commit:
> > >> >
> > >> > Could you be more specific what the test does please?
> > >> =

> > >> The sub-testcase of vm-scalability is swap-w-rand.  An RAM emulated =
pmem
> > >> device is used as a swap device, and a test program will allocate/wr=
ite
> > >> anonymous memory randomly to exercise page allocation, reclaiming, a=
nd
> > >> swapping in code path.
> > >
> > > Can I download the test with the setup to play with this?
> > =

> > There are reproduce steps in the original report email.
> > =

> > To reproduce:
> > =

> >         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp=
-tests.git
> >         cd lkp-tests
> >         bin/lkp install job.yaml  # job file is attached in this email
> >         bin/lkp run     job.yaml
> > =

> > =

> > The job.yaml and kconfig file are attached in the original report email.
> =

> Thanks for the instructions. My bad I have overlooked that in the
> initial email. I have checked the configuration file and it seems rather
> hardcoded for a particular HW. It expects a machine with 128G and
> reserves 96G!4G which might lead to different amount of memory in the
> end depending on the particular memory layout.

Indeed, the job file needs manual change.
The attached job file is the one we used on the test machine.

> =

> Before I go and try to recreate a similar setup, how stable are the
> results from this test. Random access pattern sounds like rather
> volatile to be consider for a throughput test. Or is there any other
> side effect I am missing and something fails which didn't use to
> previously.

I have the same doubt too, but the results look really stable(only for
commit 0da9597ac9c0, see below for more explanation).
We did 8 runs for this report and the standard deviation(represented by
the %stddev shown in the original report) is used to show exactly this.

I just checked the results again and found that the 8 runs for your
commit faad2185f482 all OOMed, only 1 of them is able to finish the test
before the OOM occur and got a throughput value of 38653.

The source code for this test is here:
https://git.kernel.org/cgit/linux/kernel/git/wfg/vm-scalability.git/tree/us=
emem.c
And it's started as:
./usemem --runtime 300 -n 16 --random 6368538624
which means to fork 16 processes, each dealing with 6GiB around data. By
dealing here, I mean the process each will mmap an anonymous region of
6GiB size and then write data to that area at random place, thus will
trigger swapouts and swapins after the memory is used up(since the
system has 128GiB memory and 96GiB is used by the pmem driver as swap
space, the memory will be used up after a little while).

So I guess the question here is, after the OOM rework, is the OOM
expected for such a case? If so, then we can ignore this report.

--===============2999514647921069612==--

