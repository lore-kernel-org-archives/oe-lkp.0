Content-Type: multipart/mixed; boundary="===============5125937748042567222=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 2d146aa3aa: vm-scalability.throughput -36.4% regression
Date: Wed, 01 Sep 2021 19:23:24 -0700
Message-ID: <e8d087a4-a286-3561-66ef-1e9cfb38605f@linux.intel.com>
In-Reply-To: <20210902013558.GA97410@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5125937748042567222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 9/1/2021 6:35 PM, Feng Tang wrote:
> On Wed, Sep 01, 2021 at 08:12:24AM -0700, Andi Kleen wrote:
>> Feng Tang <feng.tang@intel.com> writes:
>>> Yes, the tests I did is no matter where the 128B padding is added, the
>>> performance can be restored and even improved.
>> I wonder if we can find some cold, rarely accessed, data to put into the
>> padding to not waste it. Perhaps some name strings? Or the destroy
>> support, which doesn't sound like its commonly used.
> Yes, I tried to move 'destroy_work', 'destroy_rwork' and 'parent' over
> before the 'refcnt' together with some padding, it restored the performan=
ce
> to about 10~15% regression. (debug patch pasted below)
>
> But I'm not sure if we should use it, before we can fully explain the
> regression.

Narrowing it down to a single prefetcher seems good enough to me. The =

behavior of the prefetchers is fairly complicated and hard to predict, =

so I doubt you'll ever get a 100% step by step explanation.


-Andi


--===============5125937748042567222==--

