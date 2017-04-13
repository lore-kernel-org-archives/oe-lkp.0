Content-Type: multipart/mixed; boundary="===============9021135938930593654=="
MIME-Version: 1.0
From: Busch, Keith <keith.busch@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [irq/affinity] 13c024422c: fsmark.files_per_sec -4.3% regression
Date: Thu, 13 Apr 2017 17:14:00 +0000
Message-ID: <B58D82457FDA0744A320A2FC5AC253B93D8EE499@fmsmsx104.amr.corp.intel.com>
In-Reply-To: <20170413142426.GA22775@localhost.localdomain>
List-Id: <oe-lkp.lists.linux.dev>

--===============9021135938930593654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Actually, additional debug is not necessary. I see the accounting error in =
the patch you identified and have a fix ready for submission. Thank you for=
 finding the mistake. The incorrect setting required a fairly large number =
of CPU's with that NVMe controller, so I wouldn't have noticed it on most o=
f the servers I have access to. The 0-day regression system is incredibly h=
elpful!

-----Original Message-----
From: Keith Busch [mailto:keith.busch(a)intel.com] =

Sent: Thursday, April 13, 2017 8:24 AM
To: Ye, Xiaolong <xiaolong.ye@intel.com>
Cc: lkp(a)01.org
Subject: Re: [lkp-robot] [irq/affinity] 13c024422c: fsmark.files_per_sec -4=
.3% regression

On Thu, Apr 13, 2017 at 09:06:04AM +0800, Ye Xiaolong wrote:
> On 04/12, Busch, Keith wrote:
> >Hi Xiaolong,
> >
> >Thanks for letting me know of the regression. This change wasn't suppose=
d to affect anything outside the unbalanced numa case, so if it's indeed th=
e culprit, I'll need to fix that.
> >
> >From the machine that demonstrates the regression, could you send me 'ls=
cpu'? And the output from the following commands, both with and without the=
 patch applied?
> =

> Okay, when should I run the `lscpu` and below cmds, before, after or duri=
ng the test?

The lscpu shouldn't change at any time, so you can grab that either
before or after, with any set of patches applied.

--===============9021135938930593654==--

