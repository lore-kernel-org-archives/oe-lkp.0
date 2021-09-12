Content-Type: multipart/mixed; boundary="===============7066585793708586565=="
MIME-Version: 1.0
From: Dave Chinner <dchinner@redhat.com>
To: lkp@lists.01.org
Subject: Re: [xfs] ab23a77687: aim7.jobs-per-min -18.5% regression
Date: Mon, 13 Sep 2021 09:32:19 +1000
Message-ID: <20210912233219.GB2335@rh>
In-Reply-To: <20210909142355.GA6270@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7066585793708586565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 09, 2021 at 10:23:55PM +0800, kernel test robot wrote:
> =

> =

> Hi Dave Chinner,
> =

> we reported "[xfs]  6df693ed7b:  aim7.jobs-per-min -15.7% regression" as =
[1]
> when this change is still on
> https://git.kernel.org/cgit/linux/kernel/git/djwong/xfs-linux.git xfs-5.1=
5-merge
> =

> now this change is on mainline.
> so we report again to highlight we still observe similar performance regr=
ession
> on mainline.
> =

> previously we also tried to test by turning off RWSEM_SPIN_ON_OWNER per y=
our
> guidance, but still observed similar regression, though we are not sure i=
f our
> method to turn off RWSEM_SPIN_ON_OWNER is enough. the detail result is in=
 [2]
> =

> [1] https://lore.kernel.org/all/20210809064248.GB5761(a)xsang-OptiPlex-90=
20/
> [2] https://lore.kernel.org/all/20210818085248.GA28771(a)xsang-OptiPlex-9=
020/

Did you look at the config that was generated before running the
tests again?

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 5.14.0-rc4 Kernel Configuration
> #
....
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
....


So these tests were still run with the same RWSEM_SPIN_ON_OWNER=3Dy
configuration, and so unsurprisingly the result was the same with
spin contention on the directory inode rwsem.

You'll save yourself (and everyone else) a lot of time by validating
that your config changes are valid before re-running tests...

Cheers,

Dave.
-- =

Dave Chinner
dchinner(a)redhat.com

--===============7066585793708586565==--

