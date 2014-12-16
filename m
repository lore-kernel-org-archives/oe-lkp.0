Content-Type: multipart/mixed; boundary="===============1519809997671830583=="
MIME-Version: 1.0
From: Corey Minyard <cminyard@mvista.com>
To: lkp@lists.01.org
Subject: Re: [ipmi] BUG: key ffff880fcfc51ed0 not in .data!
Date: Tue, 16 Dec 2014 07:08:47 -0600
Message-ID: <54902EDF.8070605@mvista.com>
In-Reply-To: <CAADnVQJ8MT9mUbp2cyMOd-TUZh_fp+y35CGBiw+GEcbCRb+GrA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1519809997671830583==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 12/15/2014 08:53 PM, Alexei Starovoitov wrote:
> On Fri, Dec 12, 2014 at 8:04 PM, Corey Minyard <cminyard@mvista.com> wr=
ote:
>> On 12/11/2014 09:20 PM, Huang Ying wrote:
>>> FYI, we noticed the below changes on
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>>> commit 2ed09fc090fc0488e2ab27604a141679fe2ef610 ("ipmi: clean up the de=
vice handling for the bmc device")
>> Thanks.  The surprising thing is that this didn't give an error before.
>>
>> But this should be fixed in linux-next the next time.
> when specifically? Is there a fix already?
> Quite annoying to see this every boot:
> [    4.778018] BUG: key ffff88046458fe20 not in .data!
> [    4.778021] ------------[ cut here ]------------
> [    4.778061] WARNING: CPU: 1 PID: 1428 at
> ../kernel/locking/lockdep.c:2991 lockdep_init_map+0x4cd/0x500()
Yes, should be fixed by:

commit 693726299ba87a6e267993806bc1320a266e5c5e
Author: Corey Minyard <cminyard@mvista.com>
Date:   Fri Dec 12 19:06:07 2014 -0600

    ipmi: Finish cleanup of BMC attributes

which should be in linux-next now.  I was able to reproduce and verify
that this fixed it.  I've verified that the branch is correct in the
repository.

-corey


--===============1519809997671830583==--

