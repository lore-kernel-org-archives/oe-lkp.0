Content-Type: multipart/mixed; boundary="===============6106980170555053117=="
MIME-Version: 1.0
From: Al Viro <viro@ZenIV.linux.org.uk>
To: lkp@lists.01.org
Subject: Re: [dcache_{readdir, dir_lseek}() users] 4e82901cd6: reaim.jobs_per_min -49.1% regression
Date: Tue, 31 May 2016 14:40:11 +0100
Message-ID: <20160531134011.GB14480@ZenIV.linux.org.uk>
In-Reply-To: <20160531081515.GC11635@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6106980170555053117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2016 at 04:15:15PM +0800, kernel test robot wrote:
> =

> =

> FYI, we noticed reaim.jobs_per_min -49.1% regression due to commit:
> =

> commit 4e82901cd6d1af21ae232ae835c36d8230c809e8 ("dcache_{readdir,dir_lse=
ek}() users: switch to ->iterate_shared")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: reaim
> on test machine: lkp-hsx04: 144 threads Brickland Haswell-EX with 512G me=
mory
> with following parameters: cpufreq_governor=3Dperformance/iterations=3D4/=
nr_task=3D1600%/test=3Dfserver

[snip]

Is there any way to get the profiles?

--===============6106980170555053117==--

