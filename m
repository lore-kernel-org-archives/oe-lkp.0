Content-Type: multipart/mixed; boundary="===============7192826943588958281=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, oom] faad2185f4: vm-scalability.throughput -11.8% regression
Date: Wed, 27 Apr 2016 16:20:43 +0800
Message-ID: <87fuu7iht0.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160427073617.GA2179@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============7192826943588958281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Michal Hocko <mhocko@kernel.org> writes:

> On Wed 27-04-16 11:15:56, kernel test robot wrote:
>> FYI, we noticed vm-scalability.throughput -11.8% regression with the fol=
lowing commit:
>
> Could you be more specific what the test does please?

The sub-testcase of vm-scalability is swap-w-rand.  An RAM emulated pmem
device is used as a swap device, and a test program will allocate/write
anonymous memory randomly to exercise page allocation, reclaiming, and
swapping in code path.

Best Regards,
Huang, Ying

--===============7192826943588958281==--

