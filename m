Content-Type: multipart/mixed; boundary="===============4686045644722363678=="
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
To: lkp@lists.01.org
Subject: Re: 2989f64510 ("dma-buf: Add selftests for dma-fence"): WARNING: CPU: 0 PID: 1 at lib/debugobjects.c:524 __debug_object_init
Date: Thu, 21 Nov 2019 07:26:05 +0000
Message-ID: <157432116576.24852.2065478066028556019@skylake-alporthouse-com>
In-Reply-To: <5dd63a8f.BFdOlqs/XZAJHDfR%lkp@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4686045644722363678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Quoting kernel test robot (2019-11-21 07:19:43)
> Greetings,
> =

> 0day kernel testing robot got the below dmesg and the first bad commit is
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> commit 2989f6451084aed3f8cc9992477f7a9bf57a3716
> Author:     Chris Wilson <chris@chris-wilson.co.uk>
> AuthorDate: Mon Aug 19 10:59:27 2019 +0100
> Commit:     Chris Wilson <chris@chris-wilson.co.uk>
> CommitDate: Mon Aug 19 18:09:46 2019 +0100

That's a belated report, fixed by

commit 6ac3a0ebfcc2f0c75ca0ca6974389ce421aa5cbd
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Tue Aug 20 13:21:18 2019 +0100

	dmabuf: Mark up onstack timer for selftests

No?
-Chris
--===============4686045644722363678==--

