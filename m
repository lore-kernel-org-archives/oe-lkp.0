Content-Type: multipart/mixed; boundary="===============4616636874954821011=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [locking/mutexes] cb4bbc457b: -40.0% unixbench.score
Date: Mon, 25 Jan 2016 09:23:59 +0800
Message-ID: <87io2iih8w.fsf@yhuang-dev.intel.com>
In-Reply-To: <20160122024801.GA23224@linux-uzut.site>
List-Id: <oe-lkp.lists.linux.dev>

--===============4616636874954821011==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Davidlohr Bueso <dave@stgolabs.net> writes:

> On Fri, 22 Jan 2016, kernel test robot wrote:
>
>>FYI, we noticed the below changes on
>>
>>https://github.com/0day-ci/linux
>> Ding-Tianhong/locking-mutexes-don-t-spin-on-owner-when-wait-list-is-not-=
NULL/20160121-173317
>>commit cb4bbc457bfed6194ffab1b10c7be73b3f16ca2d ("locking/mutexes: don't =
spin on owner when wait list is not NULL.")
>
> I'm not sure why this would even be reported, as this patch has not been =
accepted
> or acked or nothin', by anyone.

Sorry for bothering.  The purpose is FYI as in the original report
email.  We test patches posted to LKML, if we found some changes related
to the patch, we will send out a report.  Hope the reviewer could
take that as information for his/her review if the report isn't totally
nonsense.

> In this particular case that raw performance drop
> is because spinning is pretty much disabled by Ding's change. Totally exp=
ected for
> the kind of workload unixbench triggers.

The report is just raw performance data, it still need people to explain
it.  Thanks a lot for your explanation.

> All this does is hurt lkml-searchability.

Sorry, I don't understand this.  You could still search the original
patch.  Could you explain a little?

Best Regards,
Huang, Ying

> Thanks,
> Davidlohr
> _______________________________________________
> LKP mailing list
> LKP(a)lists.01.org
> https://lists.01.org/mailman/listinfo/lkp

--===============4616636874954821011==--

