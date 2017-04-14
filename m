Content-Type: multipart/mixed; boundary="===============5048372016752564582=="
MIME-Version: 1.0
From: Ye Xiaolong <xiaolong.ye@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [irq/affinity] 13c024422c: fsmark.files_per_sec -4.3% regression
Date: Fri, 14 Apr 2017 08:49:07 +0800
Message-ID: <20170414004907.GL16549@yexl-desktop>
In-Reply-To: <B58D82457FDA0744A320A2FC5AC253B93D8EE499@fmsmsx104.amr.corp.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5048372016752564582==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 04/14, Busch, Keith wrote:
>Actually, additional debug is not necessary. I see the accounting error in=
 the patch you identified and have a fix ready for submission. Thank you fo=
r finding the mistake. The incorrect setting required a fairly large number=
 of CPU's with that NVMe controller, so I wouldn't have noticed it on most =
of the servers I have access to. The 0-day regression system is incredibly =
helpful!
>

I am working on to get these debug data while I receive this message, glad =
0day helps :).

Thanks,
Xiaolong


>-----Original Message-----
>From: Keith Busch [mailto:keith.busch(a)intel.com] =

>Sent: Thursday, April 13, 2017 8:24 AM
>To: Ye, Xiaolong <xiaolong.ye@intel.com>
>Cc: lkp(a)01.org
>Subject: Re: [lkp-robot] [irq/affinity] 13c024422c: fsmark.files_per_sec -=
4.3% regression
>
>On Thu, Apr 13, 2017 at 09:06:04AM +0800, Ye Xiaolong wrote:
>> On 04/12, Busch, Keith wrote:
>> >Hi Xiaolong,
>> >
>> >Thanks for letting me know of the regression. This change wasn't suppos=
ed to affect anything outside the unbalanced numa case, so if it's indeed t=
he culprit, I'll need to fix that.
>> >
>> >From the machine that demonstrates the regression, could you send me 'l=
scpu'? And the output from the following commands, both with and without th=
e patch applied?
>> =

>> Okay, when should I run the `lscpu` and below cmds, before, after or dur=
ing the test?
>
>The lscpu shouldn't change at any time, so you can grab that either
>before or after, with any set of patches applied.

--===============5048372016752564582==--

