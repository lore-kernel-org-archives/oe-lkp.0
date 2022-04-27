Content-Type: multipart/mixed; boundary="===============0334733626690254367=="
MIME-Version: 1.0
From: Yin Fengwei <fengwei.yin@intel.com>
To: lkp@lists.01.org
Subject: Re: [memcg] a8c49af3be: hackbench.throughput -13.7% regression
Date: Wed, 27 Apr 2022 13:03:58 +0800
Message-ID: <1efe101a-da55-3043-c964-f23e10bcfa79@intel.com>
In-Reply-To: <CALvZod4_vNWYxzGR3BksZYgoti-9hOioMGwF2UVRnwcAGpFqXA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0334733626690254367==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 4/27/2022 1:02 PM, Shakeel Butt wrote:
> Hi Yin,
> =

> On Tue, Apr 26, 2022 at 7:53 PM Yin Fengwei <fengwei.yin@intel.com> wro=
te:
>>
> [...]
>>
>> If I comment out one line added by the commit <a8c49af3be> :
>> static void memcg_account_kmem(struct mem_cgroup *memcg, int nr_pages)
>> {
>>         /* mod_memcg_state(memcg, MEMCG_KMEM, nr_pages); */  <--- commen=
t out this line.
> =

> Can you to comment out the following block instead of the above line
> and see if there is any impact?
> =

>>         if (!cgroup_subsys_on_dfl(memory_cgrp_subsys)) {
>>                 if (nr_pages > 0)
>>                         page_counter_charge(&memcg->kmem, nr_pages);
>>                 else
>>                         page_counter_uncharge(&memcg->kmem, -nr_pages);
>>         }
>> }
OK. I will give it a try and send the result out.


Regards
Yin, Fengwei

>>
--===============0334733626690254367==--

