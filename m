Content-Type: multipart/mixed; boundary="===============8802958159674778410=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm, slub] b47291ef02: stress-ng.lockf.ops_per_sec -24.0% regression
Date: Tue, 23 Nov 2021 16:17:07 +0800
Message-ID: <20211123081707.GA3955@shbuild999.sh.intel.com>
In-Reply-To: <20211123074709.GG35794@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8802958159674778410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2021 at 03:47:09PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -24.0% regression of stress-ng.lockf.ops_per_sec due to=
 commit:
> =

> =

> commit: b47291ef02b0bee85ffb7efd6c336060ad1fe1a4 ("mm, slub: change percp=
u partial accounting from objects to pages")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Removed external mail and maillist.

Hi Oliver,

I noticed this is a commit for mainline kernel, and I didn't see
it is copied LKML or linux-mm list, any email policy change recently?

Thanks,
Feng


> in testcase: stress-ng
> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.=
10GHz with 512G memory
> with following parameters:
> =

> 	nr_threads: 10%
> 	disk: 1HDD
> 	testtime: 60s
> 	fs: xfs
> 	class: filesystem
> 	test: lockf
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
> =

> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
--===============8802958159674778410==--

