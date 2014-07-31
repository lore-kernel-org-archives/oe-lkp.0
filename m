Content-Type: multipart/mixed; boundary="===============8123484239578959280=="
MIME-Version: 1.0
From: Rik van Riel <riel@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Thu, 31 Jul 2014 02:42:54 -0400
Message-ID: <20140731024254.3dad1156@annuminas.surriel.com>
In-Reply-To: <20140731050454.GA9386@aaronlu.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8123484239578959280==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Jul 2014 13:04:54 +0800
Aaron Lu <aaron.lu@intel.com> wrote:

> On Wed, Jul 30, 2014 at 10:25:03AM -0400, Rik van Riel wrote:
> > On 07/29/2014 10:14 PM, Aaron Lu wrote:

> > >> +#define NUMA_SCALE 1024
> > >> +#define NUMA_MOVE_THRESH (5 * NUMA_SCALE / 100)
> > =

> > It would be good to see if changing NUMA_MOVE_THRESH to
> > (NUMA_SCALE / 8) does the trick.

FWIW, running with NUMA_MOVE_THRESH set to (NUMA_SCALE / 8)
seems to resolve the SPECjbb2005 threshold on my system.

I will run some more sanity tests later today...

-- =

All rights reversed.

--===============8123484239578959280==--

