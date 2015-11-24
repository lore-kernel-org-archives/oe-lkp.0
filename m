Content-Type: multipart/mixed; boundary="===============8283407787643317083=="
MIME-Version: 1.0
From: Joonsoo Kim <iamjoonsoo.kim@lge.com>
To: lkp@lists.01.org
Subject: Re: hugepage compaction causes performance drop
Date: Tue, 24 Nov 2015 13:55:36 +0900
Message-ID: <20151124045536.GA3112@js1304-P5Q-DELUXE>
In-Reply-To: <5653DC2C.3090706@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8283407787643317083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2015 at 11:40:28AM +0800, Aaron Lu wrote:
> On 11/23/2015 05:24 PM, Joonsoo Kim wrote:
> > 2015-11-23 17:33 GMT+09:00 Aaron Lu <aaron.lu@intel.com>:
> >> On 11/23/2015 04:16 PM, Joonsoo Kim wrote:
> >>>
> >>> And, please attach always-always's vmstat numbers, too.
> >>
> >> Sure, attached the vmstat tool output, taken every second.
> > =

> > Oops... I'd like to see '1 sec interval cat /proc/vmstat' for always-ne=
ver.
> =

> Here it is, the proc-vmstat for always-never.

Okay. In this case, compaction never happen.
Could you show 1 sec interval cat /proc/pagetypeinfo for
always-always?

> BTW, I'm still learning how to do proper ftrace for this case and it may
> take a while.

You can do it simply with trace-cmd.

sudo trace-cmd record -e compaction &
run test program
fg
Ctrl + c

sudo trace-cmd report

Thanks.

--===============8283407787643317083==--

