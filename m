Content-Type: multipart/mixed; boundary="===============8243862028537595176=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, oom] faad2185f4: vm-scalability.throughput -11.8% regression
Date: Wed, 27 Apr 2016 11:17:19 +0200
Message-ID: <20160427091718.GG2179@dhcp22.suse.cz>
In-Reply-To: <87bn4vigpc.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8243862028537595176==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 27-04-16 16:44:31, Huang, Ying wrote:
> Michal Hocko <mhocko@kernel.org> writes:
> =

> > On Wed 27-04-16 16:20:43, Huang, Ying wrote:
> >> Michal Hocko <mhocko@kernel.org> writes:
> >> =

> >> > On Wed 27-04-16 11:15:56, kernel test robot wrote:
> >> >> FYI, we noticed vm-scalability.throughput -11.8% regression with th=
e following commit:
> >> >
> >> > Could you be more specific what the test does please?
> >> =

> >> The sub-testcase of vm-scalability is swap-w-rand.  An RAM emulated pm=
em
> >> device is used as a swap device, and a test program will allocate/write
> >> anonymous memory randomly to exercise page allocation, reclaiming, and
> >> swapping in code path.
> >
> > Can I download the test with the setup to play with this?
> =

> There are reproduce steps in the original report email.
> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =

> The job.yaml and kconfig file are attached in the original report email.

Thanks for the instructions. My bad I have overlooked that in the
initial email. I have checked the configuration file and it seems rather
hardcoded for a particular HW. It expects a machine with 128G and
reserves 96G!4G which might lead to different amount of memory in the
end depending on the particular memory layout.

Before I go and try to recreate a similar setup, how stable are the
results from this test. Random access pattern sounds like rather
volatile to be consider for a throughput test. Or is there any other
side effect I am missing and something fails which didn't use to
previously.
-- =

Michal Hocko
SUSE Labs

--===============8243862028537595176==--

