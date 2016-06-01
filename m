Content-Type: multipart/mixed; boundary="===============1786702081139959591=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [dcache_{readdir, dir_lseek}() users] 4e82901cd6: reaim.jobs_per_min -49.1% regression
Date: Wed, 01 Jun 2016 09:03:23 +0800
Message-ID: <87bn3laffo.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160531134011.GB14480@ZenIV.linux.org.uk>
List-Id: <oe-lkp.lists.linux.dev>

--===============1786702081139959591==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Al Viro <viro@ZenIV.linux.org.uk> writes:

> On Tue, May 31, 2016 at 04:15:15PM +0800, kernel test robot wrote:
>> =

>> =

>> FYI, we noticed reaim.jobs_per_min -49.1% regression due to commit:
>> =

>> commit 4e82901cd6d1af21ae232ae835c36d8230c809e8 ("dcache_{readdir,dir_ls=
eek}() users: switch to ->iterate_shared")
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>> =

>> in testcase: reaim
>> on test machine: lkp-hsx04: 144 threads Brickland Haswell-EX with 512G m=
emory
>> with following parameters: cpufreq_governor=3Dperformance/iterations=3D4=
/nr_task=3D1600%/test=3Dfserver
>
> [snip]
>
> Is there any way to get the profiles?

Sorry, our perf-profile support is broken after upgrading perf-profile
recently.  We will restore it ASAP and send back to you the perf profile
results.

Best Regards,
Huang, Ying

--===============1786702081139959591==--

