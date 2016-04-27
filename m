Content-Type: multipart/mixed; boundary="===============5755798944936952796=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [mm, oom] faad2185f4: vm-scalability.throughput -11.8% regression
Date: Wed, 27 Apr 2016 10:37:34 +0200
Message-ID: <20160427083733.GE2179@dhcp22.suse.cz>
In-Reply-To: <87fuu7iht0.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5755798944936952796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 27-04-16 16:20:43, Huang, Ying wrote:
> Michal Hocko <mhocko@kernel.org> writes:
> =

> > On Wed 27-04-16 11:15:56, kernel test robot wrote:
> >> FYI, we noticed vm-scalability.throughput -11.8% regression with the f=
ollowing commit:
> >
> > Could you be more specific what the test does please?
> =

> The sub-testcase of vm-scalability is swap-w-rand.  An RAM emulated pmem
> device is used as a swap device, and a test program will allocate/write
> anonymous memory randomly to exercise page allocation, reclaiming, and
> swapping in code path.

Can I download the test with the setup to play with this?
-- =

Michal Hocko
SUSE Labs

--===============5755798944936952796==--

