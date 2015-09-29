Content-Type: multipart/mixed; boundary="===============2081157869647183713=="
MIME-Version: 1.0
From: Huang, Ying <ying.huang@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 192132b9a0: -17.5% netperf.Throughput_tps
Date: Tue, 29 Sep 2015 16:45:41 +0800
Message-ID: <87h9mdlikq.fsf@yhuang-dev.intel.com>
In-Reply-To: <56036A05.8000805@cumulusnetworks.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2081157869647183713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

David Ahern <dsa@cumulusnetworks.com> writes:

> On 9/23/15 6:37 PM, Huang Ying wrote:
>>>
>>> I take it you have CONFIG_NET_VRF enabled. correct?
>>>
>>> With it disabled I see no relevant change in performance between
>>> 8f58336d3f78 and 192132b9a034. Can you confirm?
>>
>> The kconfig file is attached with the mail.  It appears that
>> CONFIG_NET_VRF is disabled.
>>
>
> Something is not adding up. I anticipate access to a multi-socket numa
> system in the next few days. Until then a couple of questions:
>
> 1. do you take patches to run your tests?

No.  We checkout your commits and test them.  Without applying any other pa=
tches.

> 2. do you have a wiki/web page with all of the tests run?

Sorry, we still have no this information now.

> I'd like to
> know what other networking tests have been run. Only this one was
> flagged, so I presume it means other tests did not hit the
> threshold. I would like to know what other tests are run.

For the commit and its parent, we have only tested the benchmark in the
report email.

Best Regards,
Huang, Ying

--===============2081157869647183713==--

