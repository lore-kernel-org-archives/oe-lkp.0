Content-Type: multipart/mixed; boundary="===============1857886633915108575=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: hugepage compaction causes performance drop
Date: Tue, 24 Nov 2015 15:27:43 +0800
Message-ID: <5654116F.1030301@intel.com>
In-Reply-To: <20151124045536.GA3112@js1304-P5Q-DELUXE>
List-Id: <oe-lkp.lists.linux.dev>

--===============1857886633915108575==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 11/24/2015 12:55 PM, Joonsoo Kim wrote:
> On Tue, Nov 24, 2015 at 11:40:28AM +0800, Aaron Lu wrote:
>> BTW, I'm still learning how to do proper ftrace for this case and it may
>> take a while.
> =

> You can do it simply with trace-cmd.
> =

> sudo trace-cmd record -e compaction &
> run test program
> fg
> Ctrl + c
> =

> sudo trace-cmd report

Thanks for the tip, I just recorded it like this:
trace-cmd record -e compaction ./usemem xxx

Due to the big size of trace.out(6MB after compress), I've uploaed it:
https://drive.google.com/open?id=3D0B49uX3igf4K4UkJBOGt3cHhOU00

The pagetypeinfo, perf and proc-vmstat is also there.

Regards,
Aaron

--===============1857886633915108575==--

