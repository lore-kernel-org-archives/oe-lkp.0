Content-Type: multipart/mixed; boundary="===============9195435714998310171=="
MIME-Version: 1.0
From: Keith Busch <keith.busch@intel.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [irq/affinity] 13c024422c: fsmark.files_per_sec -4.3% regression
Date: Thu, 13 Apr 2017 10:24:26 -0400
Message-ID: <20170413142426.GA22775@localhost.localdomain>
In-Reply-To: <20170413010604.GH31394@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============9195435714998310171==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

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

--===============9195435714998310171==--

