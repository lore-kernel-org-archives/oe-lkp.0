Content-Type: multipart/mixed; boundary="===============0051760915104417452=="
MIME-Version: 1.0
From: Dave Chinner <dchinner@redhat.com>
To: lkp@lists.01.org
Subject: Re: [xfs] bad77c375e: stress-ng.fallocate.ops_per_sec -10.0% regression
Date: Fri, 03 Dec 2021 09:04:51 +1100
Message-ID: <20211202220451.GT2206@rh>
In-Reply-To: <96fa41bb-7e9f-ae47-bf34-accef5c36fa8@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0051760915104417452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2021 at 02:46:06PM +0800, Xing Zhengjun wrote:
> Hi Dave,
> =

>    Do you have time to look at this? It still existed in v5.16-rc3. Thanks

AFAIC, it's a "don't care" issue.

The series of commits around this one:

> > > FYI, we noticed a -10.0% regression of
> > > stress-ng.fallocate.ops_per_sec due to commit:
> > > =

> > > =

> > > commit: bad77c375e8de6c776c848e443f7dc2d0d909be5 ("xfs: CIL
> > > checkpoint flushes caches unconditionally")
> > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

changed how we manage FUA/cache flushes for the journal changed
performance across a wide range of workloads. Many went a lot
faster, some (like this one) went slightly slower. Overall it was a
net win, especially on storage stacks with really slow cache flushes
(e.g. dm-thinp) and workloads that do a lot of concurrent metadata
modification.

Overall, fallocate is not a performance critical path - it's a
slowpath because it serialises all IO to that file while the
fallocate call runs. Hence performance characteristics for fallocate
aren't really a major concern to begin with...

-Dave.
-- =

Dave Chinner
dchinner(a)redhat.com

--===============0051760915104417452==--

