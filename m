Content-Type: multipart/mixed; boundary="===============5729290456717225181=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [mm] 3484b2de949: -46.2% aim7.jobs-per-min
Date: Fri, 27 Feb 2015 11:53:04 +0000
Message-ID: <20150227115304.GF3087@suse.de>
In-Reply-To: <1425021696.10337.55.camel@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5729290456717225181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2015 at 03:21:36PM +0800, Huang Ying wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> commit 3484b2de9499df23c4604a513b36f96326ae81ad ("mm: rearrange zone fiel=
ds into read-only, page alloc, statistics and page reclaim lines")
> =

> The perf cpu-cycles for spinlock (zone->lock) increased a lot.  I suspect=
 there are some cache ping-pong or false sharing.
> =


Annoying because this is pretty much the opposite of what I found during
testing. What is the kernel config? Similar to the kernel config, can you
post "pahole -C zone vmlinux" for the kernel you built? I should get the sa=
me
result if I use the same kernel config but no harm in being sure. Thanks.

-- =

Mel Gorman
SUSE Labs

--===============5729290456717225181==--

