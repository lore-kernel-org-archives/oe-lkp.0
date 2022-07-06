Content-Type: multipart/mixed; boundary="===============5374336748927726711=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [mm/page_alloc] 2bd8eec68f: BUG:sleeping_function_called_from_invalid_context_at_mm/gup.c
Date: Wed, 06 Jul 2022 12:53:29 +0100
Message-ID: <20220706115328.GE27531@techsingularity.net>
In-Reply-To: <20220706095535.GD27531@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============5374336748927726711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 06, 2022 at 10:55:35AM +0100, Mel Gorman wrote:
> On Tue, Jul 05, 2022 at 09:51:25PM +0800, Oliver Sang wrote:
> > Hi Andrew Morton,
> > =

> > On Sun, Jul 03, 2022 at 01:22:09PM -0700, Andrew Morton wrote:
> > > On Sun, 3 Jul 2022 17:44:30 +0800 kernel test robot <oliver.sang@in=
tel.com> wrote:
> > > =

> > > > FYI, we noticed the following commit (built with gcc-11):
> > > > =

> > > > commit: 2bd8eec68f740608db5ea58ecff06965228764cb ("[PATCH 7/7] mm/p=
age_alloc: Replace local_lock with normal spinlock")
> > > > url: https://github.com/intel-lab-lkp/linux/commits/Mel-Gorman/Drai=
n-remote-per-cpu-directly/20220613-230139
> > > > base: https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.g=
it b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
> > > > patch link: https://lore.kernel.org/lkml/20220613125622.18628-8-mgo=
rman(a)techsingularity.net
> > > > =

> > > =

> > > Did this test include the followup patch
> > > mm-page_alloc-replace-local_lock-with-normal-spinlock-fix.patch?
> > =

> > no, we just fetched original patch set and test upon it.
> > =

> > now we applied the patch you pointed to us upon 2bd8eec68f and found th=
e issue
> > still exist.
> > (attached dmesg FYI)
> > =

> =

> Thanks Oliver.
> =

> The trace is odd in that it hits in GUP when the page allocator is no
> longer active and the context is a syscall. First, is this definitely
> the first patch the problem occurs?
> =


I tried reproducing this on a 2-socket machine with Xeon
Gold Gold 5218R CPUs. It was necessary to set timeouts in both
vm/settings and kselftest/runner.sh to avoid timeouts. Testing with
a standard config on my original 5.19-rc3 baseline and the baseline
b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3 both passed. I tried your kernel
config with i915 disabled (would not build) and necessary storage drivers
and network drivers enabled (for boot and access). The kernel log shows
a bunch of warnings related to USBAN during boot and during some of the
tests but otherwise compaction_test completed successfully as well as
the other VM tests.

Is this always reproducible?

-- =

Mel Gorman
SUSE Labs
--===============5374336748927726711==--

