Content-Type: multipart/mixed; boundary="===============1541478262881769204=="
MIME-Version: 1.0
From: Jirka Hladky <jhladky@redhat.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] a43455a1d57: +94.1% proc-vmstat.numa_hint_faults_local
Date: Sat, 02 Aug 2014 07:28:53 +0200
Message-ID: <53DC7715.4080008@redhat.com>
In-Reply-To: <53DC6641.2050904@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1541478262881769204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 08/02/2014 06:17 AM, Rik van Riel wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 08/01/2014 05:30 PM, Jirka Hladky wrote:
>
>> I see the regression only on this box. It has 4 "Ivy Bridge-EX"
>> Xeon E7-4890 v2 CPUs.
>>
>> http://ark.intel.com/products/75251
>> http://en.wikipedia.org/wiki/List_of_Intel_Xeon_microprocessors#.22Ivy_B=
ridge-EX.22_.2822_nm.29_Expandable_2
>>
>>
>>
>> Please rerun the test on box with Ivy Bridge CPUs. It seems that
>> older CPU generations are not affected.
> That would have been good info to know :)
>
> I've been spending about a month trying to reproduce your issue on a
> Westmere E7-4860.
>
> Good thing I found all kinds of other scheduler issues along the way...

Hi Rik,

till recently I have seen the regression on all systems.

With the latest kernel, only Ivy Bridge system seems to be affected.

Jirka


--===============1541478262881769204==--

