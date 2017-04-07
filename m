Content-Type: multipart/mixed; boundary="===============8056201543802545819=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/idle] bb400b924e: fio.write_clat_95%_us -8% improvement
Date: Fri, 07 Apr 2017 14:44:56 +0800
Message-ID: <8760igaf87.fsf@yhuang-dev.intel.com>
In-Reply-To: <070BEF4AC20468458C22969097656CD94BFB56FF@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8056201543802545819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Li, Aubrey" <aubrey.li@intel.com> writes:

> On Friday, April 07, 2017 2:26 PM Huang, Ying wrote:
>> =

>> OK, we need accelerate local git tree mirror fetching.
>> =

>> Hi, Philip,
>> =

>> Now we hit this issue and it prevent Aubrey to use our system effectivel=
y, can
>> you raise the priority of this work item?
>> =

>> https://jira01.devtools.intel.com/browse/OLT-2250
>> =

>
> Should I add my task again after the commit is available or just wait?

I think it is better for you to queue the task again.  There is another
hole in queue implementation.  Your original queue should not succeed.
Philip is working on that.

Best Regards,
Huang, Ying

> Thanks,
> -Aubrey

--===============8056201543802545819==--

