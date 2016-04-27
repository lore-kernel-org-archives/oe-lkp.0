Content-Type: multipart/mixed; boundary="===============4311516001062128883=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, oom] faad2185f4: vm-scalability.throughput -11.8% regression
Date: Wed, 27 Apr 2016 16:44:31 +0800
Message-ID: <87bn4vigpc.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160427083733.GE2179@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============4311516001062128883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Michal Hocko <mhocko@kernel.org> writes:

> On Wed 27-04-16 16:20:43, Huang, Ying wrote:
>> Michal Hocko <mhocko@kernel.org> writes:
>> =

>> > On Wed 27-04-16 11:15:56, kernel test robot wrote:
>> >> FYI, we noticed vm-scalability.throughput -11.8% regression with the =
following commit:
>> >
>> > Could you be more specific what the test does please?
>> =

>> The sub-testcase of vm-scalability is swap-w-rand.  An RAM emulated pmem
>> device is used as a swap device, and a test program will allocate/write
>> anonymous memory randomly to exercise page allocation, reclaiming, and
>> swapping in code path.
>
> Can I download the test with the setup to play with this?

There are reproduce steps in the original report email.

To reproduce:

        git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-tes=
ts.git
        cd lkp-tests
        bin/lkp install job.yaml  # job file is attached in this email
        bin/lkp run     job.yaml


The job.yaml and kconfig file are attached in the original report email.

Best Regards,
Huang, Ying

--===============4311516001062128883==--

