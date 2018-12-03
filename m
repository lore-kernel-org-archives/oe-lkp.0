Content-Type: multipart/mixed; boundary="===============1708807775759886874=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] ac5b2c1891: vm-scalability.throughput -61.3% regression
Date: Mon, 03 Dec 2018 14:23:44 -0500
Message-ID: <20181203192344.GA2986@redhat.com>
In-Reply-To: <20181203185954.GM31738@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============1708807775759886874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 03, 2018 at 07:59:54PM +0100, Michal Hocko wrote:
> I have merely said that a better THP locality needs more work and during
> the review discussion I have even volunteered to work on that. There
> are other reclaim related fixes under work right now. All I am saying
> is that MADV_TRANSHUGE having numa locality implications cannot satisfy
> all the usecases and it is particurarly KVM that suffers from it.

I'd like to clarify it's not just KVM, we found with KVM because for
KVM it's fairly common to create VM that won't possibly fit in a
single node, while most other apps don't tend to allocate that much
memory.

It's trivial to reproduce the badness by running a memhog process that
allocates more than the RAM of 1 NUMA node, under defrag=3Dalways
setting (or by changing memhog to use MADV_HUGEPAGE) and it'll create
swap storms despite 75% of the RAM is completely free in a 4 node NUMA
(or 50% of RAM free in a 2 node NUMA) etc..

How can it be ok to push the system into gigabytes of swap by default
without any special capability despite 50% - 75% or more of the RAM is
free? That's the downside of the __GFP_THISNODE optimizaton.

__GFP_THISNODE helps increasing NUMA locality if your app can fit in a
single node which is the common David's workload. But if his workload
would more often than not fit in a single node, he would also run into
an unacceptable slowdown because of the __GFP_THISNODE.

I think there's lots of room for improvement for the future, but in my
view that __GFP_THISNODE as it was implemented was an incomplete hack,
that opened the door for bad VM corner cases that should not happen.

It also would be nice to have a reproducer for David's workload, the
software to run the binary on THP is not released either. We have lots
of reproducer for the corner case introduced by the __GFP_THISNODE
trick.

So this is basically a revert of the commit that made MADV_HUGEPAGE
with __GFP_THISNODE behave like a privileged (although not as static)
mbind.

I provided an alternative but we weren't sure if that was the best
long term solution that could satisfy everyone because it does have
some drawback too.

Thanks,
Andrea

--===============1708807775759886874==--

