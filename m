Content-Type: multipart/mixed; boundary="===============4826249165781367989=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [sched/idle] bb400b924e: fio.write_clat_95%_us -8% improvement
Date: Fri, 07 Apr 2017 14:58:49 +0800
Message-ID: <87tw60900m.fsf@yhuang-dev.intel.com>
In-Reply-To: <070BEF4AC20468458C22969097656CD94BFB570E@shsmsx102.ccr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4826249165781367989==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

"Li, Aubrey" <aubrey.li@intel.com> writes:

>> > Should I add my task again after the commit is available or just wait?
>> =

>> I think it is better for you to queue the task again.  There is another =
hole in
>> queue implementation.  Your original queue should not succeed.
>> Philip is working on that.
>> =

>
> Then I need to ask again, the same task are scheduled several times, how =
are their
> reports handled? The newest one overwrites the old one? or all of the rep=
orts are
> kept by the timestamp?

All test results will be kept.  You can add "debug-setup: xxx" in job
file to distinguish between that so that they will be put in different
result root.

Best Regards,
Huang, Ying

> Thanks,
> -Aubrey

--===============4826249165781367989==--

