Content-Type: multipart/mixed; boundary="===============1064285287089893300=="
MIME-Version: 1.0
From: David Ahern <dsa@cumulusnetworks.com>
To: lkp@lists.01.org
Subject: Re: [net] 192132b9a0: -17.5% netperf.Throughput_tps
Date: Wed, 23 Sep 2015 12:06:10 -0600
Message-ID: <5602EA12.2010102@cumulusnetworks.com>
In-Reply-To: <1442799211.8474.49.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1064285287089893300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/20/15 7:33 PM, Huang Ying wrote:
>> Also, this is the end patch of a series that first refactors and then
>> adds a capability. The more relevant comparison is 8f58336d3f78 to
>> 192132b9a034 (8f58336d3f78 is the commit before the series). Is it
>> possible to get this test run on your system comparing those 2
>> commits?
>

I take it you have CONFIG_NET_VRF enabled. correct?

With it disabled I see no relevant change in performance between =

8f58336d3f78 and 192132b9a034. Can you confirm?

Thanks,
David


--===============1064285287089893300==--

