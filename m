Content-Type: multipart/mixed; boundary="===============4275844917414635483=="
MIME-Version: 1.0
From: David Ahern <dsa@cumulusnetworks.com>
To: lkp@lists.01.org
Subject: Re: [net] 192132b9a0: -17.5% netperf.Throughput_tps
Date: Wed, 23 Sep 2015 21:12:05 -0600
Message-ID: <56036A05.8000805@cumulusnetworks.com>
In-Reply-To: <1443055070.8829.36.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4275844917414635483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/23/15 6:37 PM, Huang Ying wrote:
>>
>> I take it you have CONFIG_NET_VRF enabled. correct?
>>
>> With it disabled I see no relevant change in performance between
>> 8f58336d3f78 and 192132b9a034. Can you confirm?
>
> The kconfig file is attached with the mail.  It appears that
> CONFIG_NET_VRF is disabled.
>

Something is not adding up. I anticipate access to a multi-socket numa =

system in the next few days. Until then a couple of questions:

1. do you take patches to run your tests?

2. do you have a wiki/web page with all of the tests run? I'd like to =

know what other networking tests have been run. Only this one was =

flagged, so I presume it means other tests did not hit the threshold. I =

would like to know what other tests are run.

Thanks,
David

--===============4275844917414635483==--

