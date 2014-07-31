Content-Type: multipart/mixed; boundary="===============0389947354207575539=="
MIME-Version: 1.0
From: Rik van Riel <riel@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Thu, 31 Jul 2014 02:22:55 -0400
Message-ID: <53D9E0BF.1020600@redhat.com>
In-Reply-To: <20140731050454.GA9386@aaronlu.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0389947354207575539==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/31/2014 01:04 AM, Aaron Lu wrote:
> On Wed, Jul 30, 2014 at 10:25:03AM -0400, Rik van Riel wrote:
>> On 07/29/2014 10:14 PM, Aaron Lu wrote:
>>> On Tue, Jul 29, 2014 at 04:04:37PM -0400, Rik van Riel wrote:
>>>> On Tue, 29 Jul 2014 10:17:12 +0200 Peter Zijlstra
>>>> <peterz@infradead.org> wrote:
>>>> =

>>>>>> +#define NUMA_SCALE 1000 +#define NUMA_MOVE_THRESH 50
>>>>> =

>>>>> Please make that 1024, there's no reason not to use power
>>>>> of two here. This base 10 factor thing annoyed me no end
>>>>> already, its time for it to die.
>>>> =

>>>> That's easy enough.  However, it would be good to know
>>>> whether this actually helps with the regression Aaron found
>>>> :)
>>> =

>>> Sorry for the delay.
>>> =

>>> I applied the last patch and queued the hackbench job to the
>>> ivb42 test machine for it to run 5 times, and here is the
>>> result(regarding the proc-vmstat.numa_hint_faults_local
>>> field): 173565 201262 192317 198342 198595 avg: 192816
>>> =

>>> It seems it is still very big than previous kernels.
>> =

>> It looks like a step in the right direction, though.
>> =

>> Could you try running with a larger threshold?
>> =

>>>> +++ b/kernel/sched/fair.c @@ -924,10 +924,12 @@ static inline
>>>> unsigned long group_faults_cpu(struct numa_group *group, int
>>>> nid)
>>>> =

>>>> /* * These return the fraction of accesses done by a
>>>> particular task, or - * task group, on a particular numa
>>>> node.  The group weight is given a - * larger multiplier, in
>>>> order to group tasks together that are almost - * evenly
>>>> spread out between numa nodes. + * task group, on a
>>>> particular numa node.  The NUMA move threshold + * prevents
>>>> task moves with marginal improvement, and is set to 5%. */ =

>>>> +#define NUMA_SCALE 1024 +#define NUMA_MOVE_THRESH (5 *
>>>> NUMA_SCALE / 100)
>> =

>> It would be good to see if changing NUMA_MOVE_THRESH to =

>> (NUMA_SCALE / 8) does the trick.
> =

> With your 2nd patch and the above change, the result is:
> =

> "proc-vmstat.numa_hint_faults_local": [ 199708, 209152, 200638, =

> 187324, 196654 ],
> =

> avg: 198695

OK, so it is still a little higher than your original 162245.

I guess this is to be expected, since the code will be more
successful at placing a task on the right node, which results
in the task scanning its memory more rapidly for a little bit.

Are you seeing any changes in throughput?

- -- =

All rights reversed
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBAgAGBQJT2eC/AAoJEM553pKExN6DIFMH/23LsoEJ8cUqMTdWUzhXesEb
TW0yncraZ6tDkGHopTU4oFmck93XUUVSJRVjLC3lxvxAIdWt8M4GCbWN8RD1yicX
Ii9s18+2r2vkc30gkIgh2yahaqQUun9sUkuaQ4BaKlbP+hwQzB3OfU1GjR7iStFE
t04krgCAL+xL63H/4mN0Y9ZjOBUz2QYbkspS21+oEWKkFY2FyyQn+hOSnA6lSvqy
o7v4tmC8jtRXsQY+hfy1aOtMUZO5sRcYHOttlxgjE5MbnW/whhsC+oB7cWw646St
LhvhhIykl/g2Bz+E3KbfnREGn5OO7NmEhv3am2Dj5XsNHnEfxYJH/m/aTA4az/s=3D
=3D/IeV
-----END PGP SIGNATURE-----

--===============0389947354207575539==--

