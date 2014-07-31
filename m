Content-Type: multipart/mixed; boundary="===============6917819742616608008=="
MIME-Version: 1.0
From: Peter Zijlstra <peterz@infradead.org>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Thu, 31 Jul 2014 12:42:41 +0200
Message-ID: <20140731104241.GA9918@twins.programming.kicks-ass.net>
In-Reply-To: <20140729023940.37b6aebc@annuminas.surriel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6917819742616608008==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2014 at 02:39:40AM -0400, Rik van Riel wrote:
> On Tue, 29 Jul 2014 13:24:05 +0800
> Aaron Lu <aaron.lu@intel.com> wrote:
> =

> > FYI, we noticed the below changes on
> > =

> > git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > commit a43455a1d572daf7b730fe12eb747d1e17411365 ("sched/numa: Ensure ta=
sk_numa_migrate() checks the preferred node")
> > =

> > ebe06187bf2aec1  a43455a1d572daf7b730fe12e  =

> > ---------------  -------------------------  =

> >      94500 ~ 3%    +115.6%     203711 ~ 6%  ivb42/hackbench/50%-threads=
-pipe
> >      67745 ~ 4%     +64.1%     111174 ~ 5%  lkp-snb01/hackbench/50%-thr=
eads-socket
> >     162245 ~ 3%     +94.1%     314885 ~ 6%  TOTAL proc-vmstat.numa_hint=
_faults_local
> =

> Hi Aaron,
> =

> Jirka Hladky has reported a regression with that changeset as
> well, and I have already spent some time debugging the issue.

So assuming those numbers above are the difference in
numa_hint_local_faults, the report is actually a significant
_improvement_, not a regression.

On my IVB-EP I get similar numbers; using:

  PRE=3D`grep numa_hint_faults_local /proc/vmstat | cut -d' ' -f2`
  perf bench sched messaging -g 24 -t -p -l 60000
  POST=3D`grep numa_hint_faults_local /proc/vmstat | cut -d' ' -f2`
  echo $((POST-PRE))


tip/mater+origin/master		tip/master+origin/master-a43455a1d57

local	total                   local	total
faults  time                    faults  time

19971	51.384                  10104	50.838
17193	50.564                  9116	50.208
13435	49.057                  8332	51.344
23794	50.795                  9954	51.364
20255	49.463                  9598	51.258

18929.6	50.2526                 9420.8	51.0024
3863.61	0.96                    717.78	0.49

So that patch improves both local faults and runtime. Its good (even
though for the runtime we're still inside stdev overlap, so ideally I'd
do more runs).


Now I also did a run with the proposed patch, NUMA_SCALE/8 variant, and
that slightly reduces both again:

tip/master+origin/master+patch

local	total
faults  time

21296	50.541
12771	50.54
13872	52.224
23352	50.85
16516	50.705

17561.4	50.972
4613.32	0.71

So for hackbench a43455a1d57 is good and the proposed patch is making
things worse.

Let me see if I can still find my SPECjbb2005 copy to see what that
does.

--===============6917819742616608008==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="attachment.sig"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KVmVyc2lvbjogR251UEcgdjEuNC4xMiAoR05V
L0xpbnV4KQoKaVFJY0JBRUJBZ0FHQlFKVDJoMmhBQW9KRUhaSDRhUkx3T1M2aGhjUC9pcHJnTkVC
TGUrd3lQamdlKzFneVJ4NApMVkVoRk96ZXYwKzBDa1pDWFlWVnpvOGpPK3hNUFI5aEl3TjRGOUZU
dGgrZTVUeVd4UllYd21YLzNWV1VOZzlmCkdmcVZVUlJNaE8zOTNKYnNzUGh1SGVRa05KN2JXSUJv
d0VablJGdzZBM3c5cndsdTBVUXFwRndGTGZraGJlSDMKUGVzd0xWdit1aXRCcVZHMkVkcC9EbFIv
ZUZWOWRYZEptZnpZdlI2clNPTDl5ZXZMZGZyL3d2c0R5cjZ6Z09EegpwMnpOOWF6aG8vajdtdDV0
ckhzVEFVZFhueSs3bGh5YTkrMjN6Vkx3OEp1WHRGV1RqdmJBdHBEY2JDQ09GcHdaCk1wR1hvZ1hO
NnVvUmJBNDhhYW1pZGc4Sis1MVcrSy93NXhIU1NoQzBLWjFvMmhHTGpJL3JEeFllS3RLRlNXaWQK
WmNhcUt6K1R1MWxqQkNndkhBVFIyc1ZGdklCQjh6K3AxeW83ckNqWjBTVUhGRVNJa0orVnNBek5v
UkNFRWZkRgp5MTlmc1dDQWsvVlNpbktKYWFKQVk1NWw4OHR2SEhOdkkyMTRuT1BXSDhFSEdmRDA5
VkpLOXlXSC9XQVhnNjBBCmg5aTdDeWxqcXNKWXRWdjZEZVRuY0ZvUUl2NW1ac0d3UVN6QVJUNXov
K1lDT2NzbXpHbmhISkZubHFjTUFpZEgKMEpvalRDSFRqNVhuUmJMVk83Q2lIOFg5TnkxOC9CSWk2
cTF0TTFmdVBLMWg3RWM2Vk0vak95NU1EVk5tRVFZbApCMEhQT0xHa2VBUDZsKzIybTI0cmh0YmRt
YWFGTHNxWFJHRURLLzVMSUJheDArMnlSV2hqYXZ0SXdLVHRvTGxXCkw5dDVXTTliUFo3QU5CZkJO
TWVuCj03RGswCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============6917819742616608008==--

