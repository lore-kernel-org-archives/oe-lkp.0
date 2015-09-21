Content-Type: multipart/mixed; boundary="===============1598059396174672783=="
MIME-Version: 1.0
From: David Ahern <dsa@cumulusnetworks.com>
To: lkp@lists.01.org
Subject: Re: [net] 192132b9a0: -17.5% netperf.Throughput_tps
Date: Sun, 20 Sep 2015 21:48:47 -0600
Message-ID: <55FF7E1F.20004@cumulusnetworks.com>
In-Reply-To: <1442799211.8474.49.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1598059396174672783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/20/15 7:33 PM, Huang Ying wrote:
>> Clarification: The reproduce file shows 128 instances of 'netperf -t
>> TCP_CRR -c -C -l 300 -H 127.0.0.1' without an '&' on the end. Does
>> that
>> mean these 128 commands are run serially?
>
> Sorry.  It's a script bug, there should be a "&" on the end.  Will fix
> the script.

Ok.

>
>>
>> Also, this is the end patch of a series that first refactors and then
>> adds a capability. The more relevant comparison is 8f58336d3f78 to
>> 192132b9a034 (8f58336d3f78 is the commit before the series). Is it
>> possible to get this test run on your system comparing those 2
>> commits?
>
> Sure.  It is attached with the mail.

Thank you.


--===============1598059396174672783==--

