Content-Type: multipart/mixed; boundary="===============6377494172274503582=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [sched/numa] f6183ef98b: phoronix-test-suite.aom-av1.0.frames_per_second -25.0% regression
Date: Wed, 26 Feb 2020 08:33:27 +0000
Message-ID: <20200226083327.GC3818@techsingularity.net>
In-Reply-To: <CAKfTPtD_ZJhJywWkPjZh6o_7TVZKbvH-D+-K_9RSoi+8L6cC2A@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6377494172274503582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2020 at 09:03:26AM +0100, Vincent Guittot wrote:
> Hi Rong,
> =

> On Wed, 26 Feb 2020 at 02:33, kernel test robot <rong.a.chen@intel.com>=
 wrote:
> >
> > Greeting,
> >
> > FYI, we noticed a -25.0% regression of phoronix-test-suite.aom-av1.0.fr=
ames_per_second due to commit:
> >
> >
> > commit: f6183ef98bba39a5de563d4ab4bc889ff2b600d7 ("sched/numa: replace =
runnable_load_avg by load_avg")
> > https://git.kernel.org/cgit/linux/kernel/git/mel/linux.git sched-lbnuma=
-rewrite-v2r6
> =

> The following patches in the branch recover the perf regression. Do
> you see regression on the whole branch ?
> =


If not, include "sched/fair: fix statistics for find_idlest_group" on top,
particularly if the workload is configured to use threads >=3D nr_cpus.

-- =

Mel Gorman
SUSE Labs
--===============6377494172274503582==--

