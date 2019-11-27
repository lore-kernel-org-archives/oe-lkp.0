Content-Type: multipart/mixed; boundary="===============6597534812853703330=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: lkp@lists.01.org
Subject: Re: 2989f64510 ("dma-buf: Add selftests for dma-fence"): WARNING: CPU: 0 PID: 1 at lib/debugobjects.c:524 __debug_object_init
Date: Wed, 27 Nov 2019 15:30:54 +0800
Message-ID: <20191127073054.GG30842@intel.com>
In-Reply-To: <20191122013244.GC313@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6597534812853703330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2019 at 09:32:45AM +0800, Philip Li wrote:
> On Thu, Nov 21, 2019 at 07:26:05AM +0000, Chris Wilson wrote:
> > Quoting kernel test robot (2019-11-21 07:19:43)
> > > Greetings,
> > > =

> > > 0day kernel testing robot got the below dmesg and the first bad commi=
t is
> > > =

> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ma=
ster
> > > =

> > > commit 2989f6451084aed3f8cc9992477f7a9bf57a3716
> > > Author:     Chris Wilson <chris@chris-wilson.co.uk>
> > > AuthorDate: Mon Aug 19 10:59:27 2019 +0100
> > > Commit:     Chris Wilson <chris@chris-wilson.co.uk>
> > > CommitDate: Mon Aug 19 18:09:46 2019 +0100
> > =

> > That's a belated report, fixed by
> Hi Chris, thanks for the feedback, we will double check this report and
> provide update later.
Hi Chris, it is confirmed that this report is false positive. 6ac3a0e had
fixed the issue. Sorry for inconvenience.

> =

> > =

> > commit 6ac3a0ebfcc2f0c75ca0ca6974389ce421aa5cbd
> > Author: Chris Wilson <chris@chris-wilson.co.uk>
> > Date:   Tue Aug 20 13:21:18 2019 +0100
> > =

> > 	dmabuf: Mark up onstack timer for selftests
> > =

> > No?
> > -Chris
--===============6597534812853703330==--

