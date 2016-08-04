Content-Type: multipart/mixed; boundary="===============1248359222326490717=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [shmem] 071904e8df: meminfo.AnonHugePages +553.5% increase
Date: Thu, 04 Aug 2016 02:10:12 -0700
Message-ID: <20160804021012.4c6f4876716bdc593c176a97@linux-foundation.org>
In-Reply-To: <20160804085409.GI19697@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============1248359222326490717==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 4 Aug 2016 16:54:09 +0800 kernel test robot <xiaolong.ye@intel.co=
m> wrote:

> FYI, we noticed meminfo.AnonHugePages +553.5% increase due to commit:
> =

> commit 071904e8dfed9525f9da86523caf78b6da5f9e7e ("shmem: get_unmapped_are=
a align huge page")
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master

hm, that seems like a good thing.

>     20428   9%    +553.5%     133500   7%  meminfo.AnonHugePages
>     42717   4%    +261.3%     154340   6%  meminfo.AnonPages

But AnonPages increased tremendously as well.

Not sure I understand this...

--===============1248359222326490717==--

